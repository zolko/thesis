package hu.bme.thesis.viatra.rules

import hu.bme.thesis.queries.Patterns
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRuleFactory
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationStatements
import org.eclipse.xtend.lib.annotations.Accessors
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation
import org.eclipse.viatra.emf.runtime.rules.BatchTransformationRuleGroup
import java.io.File
import java.io.FileWriter
import hu.bme.thesis.queries.SensorsWithMqttMatch

class ThesisRuleProvider {
	
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
	val sensorsWithMqttRule = createRule.precondition(sensorsWithMqtt).action[ match |
		createPublisher(match)
		createSubscriber(match)
	].build
	
	public def addRules(BatchTransformation transformation) {
		val rules = new BatchTransformationRuleGroup(
			sensorsRule,
			sensorsWithMqttRule
		)
		
		transformation.addRules(rules)
	}
	
	private def createSubscriber(SensorsWithMqttMatch match) {
		val subscriberFile = new File(System.getProperty("user.dir") + "\\resources\\" + match.sensor.name + "Receiver.java")
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
		import org.eclipse.paho.client.mqttv3.MqttClient;
		import org.eclipse.paho.client.mqttv3.MqttConnectOptions;
		import org.eclipse.paho.client.mqttv3.MqttMessage;
		import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence;
		
		class «match.sensor.name»Receiver implements MqttCallback {
			
			private MqttClient client;
			private MqttConnectOptions connOpts;
			private MemoryPersistence persistance;
			private BsonFactory factory;
			private Resource resource;
			
			public «match.sensor.name»Receiver() {
				factory = new BsonFactory();
				Resource.Factory.Registry reg = Resource.Factory.Registry.INSTANCE;
				Map<String,Object> m = reg.getExtensionToFactoryMap();
		        m.put("model", new XMIResourceFactoryImpl());
		        ResourceSet resourceSet = new ResourceSetImpl();
		        resource = resourceSet.createResource(URI.createURI("model/thesis.model"));
				
				persistance = new MemoryPersistence();
				client = new MqttClient("«match.setup.brokerUrl»", "«match.sensor.name.toUpperCase»_SUBSCRIBER", persistance);
				connOpts = new MqttConnectOptions();
				connOpts.setCleanSession(true);
				client.setCallback(this);
			}
			
			public void connect() {
				client.connect(connOpts);
			}
			
			public void subscribe() {
				client.subscribe(«match.sensor.name»);
			}
			
			public void unsubscribe() {
				client.unsubscribe(«match.sensor.name»);
			}
			
			public void disconnect() {
				client.disconnect();
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
				System.out.println("-------------------------------------");
				System.out.println("| Topic:" + topic);
				System.out.println("| Sensor ID:" + message.getPayload().toString());
				System.out.println("-------------------------------------");
				addValueToModel(message.getPayload());
			}
			
			private void addValueToModel(byte[] bytes) {
				JsonParser parser = factory.createParser(bytes);
				Sensor sensor = ModelFactory.eINSTANCE.createSensor();
				parser.nextToken();
				while (parser.nextToken() != JsonToken.END_OBJECT) {
					String fieldname = parser.getCurrentName();
					parser.nextToken();
					if (fieldname.equals("id")) {
						sensor.setId(parser.getText());
					}
				}
			}
		}
		'''
		writer.write(fileContent)
		writer.close
	}
	
	private def createPublisher(SensorsWithMqttMatch match) {
		val publisherFile = new File(System.getProperty("user.dir") + "\\resources\\" + match.sensor.name + "Publisher.c")
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
		
		int main(int argc, char* argv[])
		{
		    MQTTClient client;
		
			init(&client);
			connect(&client, 1);
			char* message = "Hello World!";
			publishMessage(&client, message);
			disconnect(&client);
		
			return 0;
		}
		
		void init(MQTTClient client) {
			MQTTClient_create(&client, "«match.setup.brokerUrl»", "«match.sensor.name.toUpperCase»_PUBLISHER", MQTTCLIENT_PERSISTENCE_NONE, NULL);
		}
		
		void connect(MQTTClient client, int cleansession) {
			MQTTClient_connectOptions conn_opts = MQTTClient_connectOptions_initializer;
			conn_opts.cleansession = cleansession;
			MQTTClient_connect(client, &conn_opts);
		}
		
		void publishMessage(MQTTClient client, void* payload) {
			MQTTClient_deliveryToken token;
			MQTTClient_message message = MQTTClient_message_initializer;
			message.payload = payload;
			message.payloadlen = sizeof(payload);
			message.qos = «match.sensor.messages.get(0).qos»;
			MQTTClient_publishMessage(client, "«match.sensor.name»", &message, &token);
		}
		
		void disconnect(MQTTClient client) {
			MQTTClient_disconnect(client, 1000L);
			MQTTClient_destroy(&client);
		}
		'''
		writer.write(fileContent)
		writer.close
	}
	
}