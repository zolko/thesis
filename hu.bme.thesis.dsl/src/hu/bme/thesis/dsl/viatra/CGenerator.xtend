package hu.bme.thesis.dsl.viatra

import hu.bme.thesis.dsl.sensorDsl.MqttSetup
import hu.bme.thesis.dsl.sensorDsl.Sensor
import java.io.File
import java.io.FileWriter

class CGenerator {
	
	public static def generateCFiles(MqttSetup setup, Sensor sensor, String path) {
		CGenerator.createPublisherHeaders(sensor, path)
		CGenerator.createPublisherSources(setup, sensor, path)
		CGenerator.createSubscriberHeaders(sensor, path)
		CGenerator.createSubscriberSources(setup, sensor, path)
	}
	
	private static def createSubscriberHeaders(Sensor sensor, String path) {
		//val subscriberFile = new File(path + sensor.name + "Subscriber.h")
		val subscriberFile = new File(System.getProperty("user.dir") + "\\generated\\" + sensor.name.toFirstUpper + "Subscriber.h")
		if (subscriberFile != null && subscriberFile.exists) {
			subscriberFile.delete
		}
		subscriberFile.createNewFile
		val writer = new FileWriter(subscriberFile)
		val fileContent = '''
		#ifndef «sensor.name.toUpperCase»SUBSCRIBER_H_
		#define «sensor.name.toUpperCase»SUBSCRIBER_H_
		
		#include "stdio.h"
		#include "stdlib.h"
		#include "string.h"
		#include "MQTTClient.h"
		
		void «sensor.name»SubscriberInit(MQTTClient client);
		void «sensor.name»SubscriberConnect(MQTTClient client, int cleansession);
		void «sensor.name»SubscriberSubscribe(MQTTClient client, int qos);
		void «sensor.name»SubscriberUnsubscribe(MQTTClient client);
		void «sensor.name»SubscriberDisconnect(MQTTClient client);
		void «sensor.name»ConnLost(void *context, char *cause);
		void «sensor.name»Delivered(void *context, MQTTClient_deliveryToken dt);
		void «sensor.name»MessageArrived(void *context, char *topicName, int topicLen, MQTTClient_message *message);
		'''
		writer.write(fileContent)
		writer.close
	}
	
	private static def createSubscriberSources(MqttSetup setup, Sensor sensor, String path) {
		//val publisherFile = new File(path + sensor.name + "Subscriber.c")
		val publisherFile = new File(System.getProperty("user.dir") + "\\generated\\" + sensor.name.toFirstUpper + "Subscriber.c")
		if (publisherFile != null && publisherFile.exists) {
			publisherFile.delete
		}
		publisherFile.createNewFile
		val writer = new FileWriter(publisherFile)
		val fileContent = '''
		#include "«sensor.name»Subscriber.h"
		
		volatile MQTTClient_deliveryToken deliveredtoken;
		
		void «sensor.name»SubscriberInit(MQTTClient client) {
			MQTTClient_create(&client, "«setup.brokerUrl»", "«sensor.name.toUpperCase»_PUBLISHER", MQTTCLIENT_PERSISTENCE_NONE, NULL);
		}
		
		void «sensor.name»SubscriberConnect(MQTTClient client, int cleansession) {
			MQTTClient_connectOptions conn_opts = MQTTClient_connectOptions_initializer;
			conn_opts.cleansession = cleansession;
			MQTTClient_connect(client, &conn_opts);
		}
		
		void «sensor.name»SubscriberSubscribe(MQTTClient client, int qos) {
			MQTTClient_subscribe(client, «sensor.name», qos);
		}
		
		void «sensor.name»SubscriberUnsubscribe(MQTTClient client) {
			MQTTClient_unsubscribe(client, «sensor.name»);
		}
		
		void «sensor.name»SubscriberDisconnect(MQTTClient client) {
			MQTTClient_disconnect(client, 1000L);
			MQTTClient_destroy(&client);
		}
		
		void «sensor.name»ConnLost(void *context, char *cause) {
			printf("\nConnection lost\n");
			printf("     cause: %s\n", cause);
		}
		
		void «sensor.name»Delivered(void *context, MQTTClient_deliveryToken dt) {
			printf("Message with token value %d delivery confirmed\n", dt);
			deliveredtoken = dt;
		}
		
		void «sensor.name»MessageArrived(void *context, char *topicName, int topicLen, MQTTClient_message *message) {
			
		}
		'''
		writer.write(fileContent)
		writer.close
	}
	
	private static def createPublisherHeaders(Sensor sensor, String path) {
		//val publisherFile = new File(path + sensor.name + "Publisher.h")
		val publisherFile = new File(System.getProperty("user.dir") + "\\generated\\" + sensor.name.toFirstUpper + "Publisher.h")
		if (publisherFile != null && publisherFile.exists) {
			publisherFile.delete
		}
		publisherFile.createNewFile
		val writer = new FileWriter(publisherFile)
		val fileContent = '''
		#ifndef «sensor.name.toUpperCase»PUBLISHER_H_
		#define «sensor.name.toUpperCase»PUBLISHER_H_
		
		#include "stdio.h"
		#include "stdlib.h"
		#include "string.h"
		#include "MQTTClient.h"
		
		void «sensor.name»PublisherInit(MQTTClient client);
		void «sensor.name»PublisherConnect(MQTTClient client, int cleansession);
		void «sensor.name»PublisherPublishMessage(MQTTClient client, void* payload, int qos);
		void «sensor.name»PublisherDisconnect(MQTTClient client);
		'''
		writer.write(fileContent)
		writer.close
	}
	
	private static def createPublisherSources(MqttSetup setup, Sensor sensor, String path) {
		//val publisherFile = new File(path + sensor.name + "Publisher.c")
		val publisherFile = new File(System.getProperty("user.dir") + "\\generated\\" + sensor.name.toFirstUpper + "Publisher.c")
		if (publisherFile != null && publisherFile.exists) {
			publisherFile.delete
		}
		publisherFile.createNewFile
		val writer = new FileWriter(publisherFile)
		val fileContent = '''
		#include "«sensor.name»Publisher.h"
		
		void «sensor.name»PublisherInit(MQTTClient client) {
			MQTTClient_create(&client, "«setup.brokerUrl»", "«sensor.name.toUpperCase»_PUBLISHER", MQTTCLIENT_PERSISTENCE_NONE, NULL);
		}
		
		void «sensor.name»PublisherConnect(MQTTClient client, int cleansession) {
			MQTTClient_connectOptions conn_opts = MQTTClient_connectOptions_initializer;
			conn_opts.cleansession = cleansession;
			MQTTClient_connect(client, &conn_opts);
		}
		
		void «sensor.name»PublisherPublishMessage(MQTTClient client, void* payload, int qos) {
			MQTTClient_deliveryToken token;
			MQTTClient_message message = MQTTClient_message_initializer;
			message.payload = payload;
			message.payloadlen = sizeof(payload);
			message.qos = qos;
			MQTTClient_publishMessage(client, "«sensor.name»", &message, &token);
		}
		
		void «sensor.name»PublisherDisconnect(MQTTClient client) {
			MQTTClient_disconnect(client, 1000L);
			MQTTClient_destroy(&client);
		}
		'''
		writer.write(fileContent)
		writer.close
	}
	
	private static def createMain(Sensor sensor, String path) {
		//val publisherFile = new File(path + sensor.name + "Publisher.c")
		val publisherFile = new File(System.getProperty("user.dir") + "\\generated\\" + sensor.name.toFirstUpper + "Publisher.c")
		if (publisherFile != null && publisherFile.exists) {
			publisherFile.delete
		}
		publisherFile.createNewFile
		val writer = new FileWriter(publisherFile)
		val fileContent = '''
		#include "«sensor.name»Publisher.h"
		
		«FOR message:sensor.messages»
		struct «message.name.toFirstUpper» {
			«FOR parameter:message.parameters»
			«parameter.type.name» «parameter.name»;
			«ENDFOR»
		};

		«ENDFOR»
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
		'''
		writer.write(fileContent)
		writer.close
	}
	
}