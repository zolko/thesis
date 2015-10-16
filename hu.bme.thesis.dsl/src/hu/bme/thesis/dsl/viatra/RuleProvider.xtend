package hu.bme.thesis.dsl.viatra

import hu.bme.thesis.dsl.queries.Patterns
import hu.bme.thesis.dsl.sensorDsl.MqttSetup
import hu.bme.thesis.dsl.sensorDsl.Sensor
import java.io.File
import java.io.FileWriter
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.viatra.emf.runtime.rules.BatchTransformationRuleGroup
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationStatements
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation
import org.eclipse.xtend.lib.annotations.Accessors

class RuleProvider {
	
	static extension val Patterns codeGenQueries = Patterns.instance
	
	extension val BatchTransformationRuleFactory factory = new BatchTransformationRuleFactory
	
	IncQueryEngine engine
	
	extension BatchTransformationStatements statements
	
	new(IncQueryEngine engine, BatchTransformationStatements statements) {
		this.engine = engine
		this.statements = statements
	}
	
	@Accessors(PUBLIC_GETTER)
	val sensorsRule = createRule.precondition(sensors).action[ match |
		println('''Sensor id: «match.sensor.name»''')
	].build
	
	@Accessors(PUBLIC_GETTER)
	val modelRule = createRule.precondition(model).action[ match |
		for (sensor : match.model.sensors) {
			createPublisher(match.model.mqttSetup, sensor)
			createSubscriber(match.model.mqttSetup, sensor)
		}
	].build
	
	public def addRules(BatchTransformation transformation) {
		val rules = new BatchTransformationRuleGroup(
			sensorsRule,
			modelRule
		)
		
		transformation.addRules(rules)
	}
	
	public def generateGeneralSubscriber() {
		val subscriberFile = new File("C:\\Users\\selmecziz\\work\\eclipses\\Teqbox\\ws\\Subscriber.java")
		if (subscriberFile != null && subscriberFile.exists) {
			subscriberFile.delete
		}
		subscriberFile.createNewFile
		val writer = new FileWriter(subscriberFile)
		val fileContent = '''
		import org.eclipse.paho.client.mqttv3.MqttCallback;
		import org.eclipse.paho.client.mqttv3.MqttClient;
		import org.eclipse.paho.client.mqttv3.MqttConnectOptions;
		import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence;
		
		class Subscriber {
			
			private MqttClient client;
			private MqttConnectOptions connOpts;
			private MemoryPersistence persistance;
			
			public Subscriber(String brokerUrl, String clientId) {				
				persistance = new MemoryPersistence();
				client = new MqttClient(brokerUrl, clientId, persistance);
				connOpts = new MqttConnectOptions();
				connOpts.setCleanSession(true);
			}
			
			public void setCallback(MqttCallback callback) {
				client.setCallback(callback);
			}
			
			public void connect() {
				client.connect(connOpts);
			}
			
			public void subscribe(String topic) {
				client.subscribe(topic);
			}
			
			public void unsubscribe(String) {
				client.unsubscribe(topic);
			}
			
			public void disconnect() {
				client.disconnect();
			}
			
		}
		'''
		writer.write(fileContent)
		writer.close
	}
	
	private def createSubscriber(MqttSetup setup, Sensor sensor) {
		//val subscriberFile = new File(System.getProperty("user.dir") + "\\resources\\" + sensor.name + "Receiver.java")
		val subscriberFile = new File("C:\\Users\\selmecziz\\work\\eclipses\\Teqbox\\ws\\" + sensor.name + "Receiver.java")
		if (subscriberFile != null && subscriberFile.exists) {
			subscriberFile.delete
		}
		subscriberFile.createNewFile
		val writer = new FileWriter(subscriberFile)
		val fileContent = '''
		import de.undercouch.bson4jackson.BsonFactory;
		import hu.bme.thesis.model.ModelFactory;
		import org.eclipse.emf.common.util.URI;
		import org.eclipse.emf.ecore.resource.Resource;
		import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl;
		import org.eclipse.emf.ecore.xmi.impl.XMIResourceFactoryImpl;
		import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
		import org.eclipse.paho.client.mqttv3.MqttCallback;
		import org.eclipse.paho.client.mqttv3.MqttMessage;
		
		class «sensor.name»Receiver implements MqttCallback {
			
			private Subscriber subscriber;
			private BsonFactory factory;
			private Resource resource;
			
			public «sensor.name»Receiver() {
				factory = new BsonFactory();
				Resource.Factory.Registry reg = Resource.Factory.Registry.INSTANCE;
				Map<String,Object> m = reg.getExtensionToFactoryMap();
		        m.put("model", new XMIResourceFactoryImpl());
		        ResourceSet resourceSet = new ResourceSetImpl();
		        resource = resourceSet.createResource(URI.createURI("model/thesis.model"));
				
				subscriber = new Subscriber("«setup.brokerUrl»", "«sensor.name.toUpperCase»_SUBSCRIBER");
				subscriber.setCallback(this);
			}
			
			public void connect() {
				subscriber.connect();
			}
			
			public void subscribe() {
				subscriber.subscribe(«sensor.name»);
			}
			
			public void unsubscribe() {
				subscriber.unsubscribe(«sensor.name»);
			}
			
			public void disconnect() {
				subscriber.disconnect();
			}
			
			@Override
			public void connectionLost(Throwable arg0) {
				throw new UnsupportedOperationException("Connection lost!");
			}
		
			@Override
			public void deliveryComplete(IMqttDeliveryToken arg0) {
				System.out.println("Delivery completed!");
			}
		
			@Override
			public void messageArrived(String topic, MqttMessage message) throws Exception {
				ByteArrayInputStream bais = new ByteArrayInputStream(message.getPayload());
				ObjectMapper mapper = new ObjectMapper(factory);
				Message message = (Message) resource.getContents().get(0);
				mapper.readValue(bais, Message.class);
				//TODO!
			}
		}
		'''
		writer.write(fileContent)
		writer.close
	}
	
	private def createPublisher(MqttSetup setup, Sensor sensor) {
		//val publisherFile = new File(System.getProperty("user.dir") + "\\resources\\" + sensor.name + "Publisher.c")
		val publisherFile = new File("C:\\Users\\selmecziz\\work\\eclipses\\Teqbox\\ws\\" + sensor.name + "Publisher.c")
		if (publisherFile != null && publisherFile.exists) {
			publisherFile.delete
		}
		publisherFile.createNewFile
		val writer = new FileWriter(publisherFile)
		val fileContent = '''
		#include "stdio.h"
		#include "stdlib.h"
		#include "string.h"
		#include "MQTTClient.h"
		
		«FOR message:sensor.messages»
		struct «message.name.toFirstUpper» {
			«FOR parameter:message.parameters»
			«parameter.type.name» «parameter.name»;
			«ENDFOR»
		};
		
		«ENDFOR»
		void init(MQTTClient client);
		void connect(MQTTClient client, int cleansession);
		void publishMessage(MQTTClient client, void* payload);
		void disconnect(MQTTClient client);
		
		int main(int argc, char* argv[])
		{
		    MQTTClient client;
		
			init(&client);
			connect(&client, 1);
			«FOR message:sensor.messages»
			struct «message.name.toFirstUpper» «message.name»Message;
			«FOR parameter:message.parameters»
			«message.name»Message.«parameter.name» = "Hello World!";
			«ENDFOR»
			publishMessage(&client, &«message.name»Message);
			«ENDFOR»
			disconnect(&client);
		
			return 0;
		}
		
		void init(MQTTClient client) {
			MQTTClient_create(&client, "«setup.brokerUrl»", "«sensor.name.toUpperCase»_PUBLISHER", MQTTCLIENT_PERSISTENCE_NONE, NULL);
		}
		
		void connect(MQTTClient client, int cleansession) {
			MQTTClient_connectOptions conn_opts = MQTTClient_connectOptions_initializer;
			conn_opts.cleansession = cleansession;
			MQTTClient_connect(client, &conn_opts);
		}
		
		«FOR message:sensor.messages»
		void publishMessage(MQTTClient client, void* payload) {
			MQTTClient_deliveryToken token;
			MQTTClient_message message = MQTTClient_message_initializer;
			message.payload = payload;
			message.payloadlen = sizeof(payload);
			message.qos = «message.qos»;
			MQTTClient_publishMessage(client, "«sensor.name»", &message, &token);
		}
		«ENDFOR»
		
		void disconnect(MQTTClient client) {
			MQTTClient_disconnect(client, 1000L);
			MQTTClient_destroy(&client);
		}
		'''
		writer.write(fileContent)
		writer.close
	}
	
}