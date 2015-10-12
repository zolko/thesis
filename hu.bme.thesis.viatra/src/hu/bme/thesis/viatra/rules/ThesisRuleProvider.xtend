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
		println('''Sensor id: «match.sensor.id»''')
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
		val subscriberFile = new File("C:\\Eclipses\\Thesis\\ws\\generated\\" + match.sensor.id + "Subscriber.java")
		if (subscriberFile != null && subscriberFile.exists) {
			subscriberFile.delete
		}
		subscriberFile.createNewFile
		val writer = new FileWriter(subscriberFile)
		val fileContent = '''import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken
import org.eclipse.paho.client.mqttv3.MqttCallback
import org.eclipse.paho.client.mqttv3.MqttClient
import org.eclipse.paho.client.mqttv3.MqttConnectOptions
import org.eclipse.paho.client.mqttv3.MqttMessage
import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence

class «match.sensor.id»Receiver implements MqttCallback {
	
	private MqttClient client;
	private MqttConnectOptions connOpts;
	private MemoryPersistence persistance;
	
	public «match.sensor.id»Receiver() {
		persistance = new MemoryPersistence();
		client = new MqttClient("«match.setup.brokerUrl»", "«match.sensor.id.toUpperCase»_SUBSCRIBER", persistance);
		connOpts = new MqttConnectOptions();
		connOpts.setCleanSession(true);
		client.setCallback(this);
	}
	
	public void connect() {
		client.connect(connOpts);
	}
	
	public void subscribe() {
		client.subscribe(«match.sensor.id»);
	}
	
	public void unsubscribe() {
		client.unsubscribe(«match.sensor.id»);
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
		System.out.println("| Sensor ID:" + message.getPayload.toString());
		System.out.println("-------------------------------------");
	}
}
		'''
		writer.write(fileContent)
		writer.close
	}
	
	private def createPublisher(SensorsWithMqttMatch match) {
		val publisherFile = new File("C:\\Eclipses\\Thesis\\ws\\generated\\" + match.sensor.id + "Publisher.c")
		if (publisherFile != null && publisherFile.exists) {
			publisherFile.delete
		}
		publisherFile.createNewFile
		val writer = new FileWriter(publisherFile)
		val fileContent = '''#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include "MQTTClient.h"

int main(int argc, char* argv[])
{
    MQTTClient client;

	init(&client, «match.setup.brokerUrl», "«match.sensor.id.toUpperCase»_PUBLISHER");
	connect(&client, 1);
	char* payload = "Hello World!";
	publishMessage(&client, "«match.sensor.id»", «match.setup.qos», payload);
	disconnect(&client);

	return 0;
}

void init(MQTTClient client, char* brokerUrl, char* clientId) {
	MQTTClient_create(&client, brokerUrl, clientId, MQTTCLIENT_PERSISTENCE_NONE, NULL);
}

void connect(MQTTClient client, int cleansession) {
	MQTTClient_connectOptions conn_opts = MQTTClient_connectOptions_initializer;
	conn_opts.cleansession = cleansession;
	MQTTClient_connect(client, &conn_opts);
}

void publishMessage(MQTTClient client, char* topic, int qos, void* payload) {
	MQTTClient_deliveryToken token;
	MQTTClient_message message = MQTTClient_message_initializer;
	message.payload = payload;
	message.payloadlen = sizeof(payload);
	message.qos = qos;
	MQTTClient_publishMessage(client, topic, &message, &token);
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