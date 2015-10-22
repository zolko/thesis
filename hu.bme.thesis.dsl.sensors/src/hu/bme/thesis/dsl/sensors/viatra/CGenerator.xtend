package hu.bme.thesis.dsl.sensors.viatra

import hu.bme.thesis.dsl.sensors.sensorsDsl.MqttSetup
import hu.bme.thesis.dsl.sensors.sensorsDsl.Sensor
import java.io.File
import java.io.FileWriter

class CGenerator {
	
	public static def generateCFiles(MqttSetup setup, Sensor sensor, String path) {
		val rootFolder = createFolder(path)
		val projectFolder = createFolder(new File(rootFolder, "hu.bme.thesis.generated.c").absolutePath)
		val srcFolder = createFolder(new File(projectFolder, "src").absolutePath)
		createPublisherHeaders(sensor, srcFolder)
		createPublisherSources(setup, sensor, srcFolder)
		createSubscriberHeaders(sensor, srcFolder)
		createSubscriberSources(setup, sensor, srcFolder)
		createMain(sensor, srcFolder)
	}
	
	private static def createFolder(String path) {
		val file = new File(path)
		if (file != null && file.parentFile.exists) {
			if (!file.exists) {
				file.mkdir
			}
			return file
		}
		return null
	}
	
	private static def createFile(File folder, String name) {
		val file = new File(folder, name)
		if (file != null) {
			if (file.exists) {
				file.delete
			}
			file.createNewFile
		}
		return file
	}
	
	public static def generateCProjectFile(String path) {
		val rootFolder = createFolder(path)
		val projectFolder = createFolder(new File(rootFolder, "hu.bme.thesis.generated.c").absolutePath)
		val cprojectFile = createFile(projectFolder, ".cproject")
		val writer = new FileWriter(cprojectFile)
		val fileContent = '''
		TODO!!
		'''
		writer.write(fileContent)
		writer.close
	}
	
	public static def generateProjectFile(String path) {
		val rootFolder = createFolder(path)
		val projectFolder = createFolder(new File(rootFolder, "hu.bme.thesis.generated.c").absolutePath)
		val projectFile = createFile(projectFolder, ".project")
		val writer = new FileWriter(projectFile)
		val fileContent = '''
		<?xml version="1.0" encoding="UTF-8"?>
		<projectDescription>
			<name>com.incquerylabs.teqbox.mqtt.cpp</name>
			<comment></comment>
			<projects>
			</projects>
			<buildSpec>
				<buildCommand>
					<name>org.eclipse.cdt.managedbuilder.core.genmakebuilder</name>
					<triggers>clean,full,incremental,</triggers>
					<arguments>
					</arguments>
				</buildCommand>
				<buildCommand>
					<name>org.eclipse.cdt.managedbuilder.core.ScannerConfigBuilder</name>
					<triggers>full,incremental,</triggers>
					<arguments>
					</arguments>
				</buildCommand>
			</buildSpec>
			<natures>
				<nature>org.eclipse.cdt.core.cnature</nature>
				<nature>org.eclipse.cdt.managedbuilder.core.managedBuildNature</nature>
				<nature>org.eclipse.cdt.managedbuilder.core.ScannerConfigNature</nature>
			</natures>
		</projectDescription>
		'''
		writer.write(fileContent)
		writer.close
	}
	
	private static def createSubscriberHeaders(Sensor sensor, File srcFolder) {
		val subscriberFile = createFile(srcFolder, sensor.name.toFirstUpper + "Subscriber.h")
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
		int «sensor.name»MessageArrived(void *context, char *topicName, int topicLen, MQTTClient_message *message);
		
		#endif /* «sensor.name.toUpperCase»SUBSCRIBER_H_ */
		'''
		writer.write(fileContent)
		writer.close
	}
	
	private static def createSubscriberSources(MqttSetup setup, Sensor sensor, File srcFolder) {
		val publisherFile = createFile(srcFolder, sensor.name.toFirstUpper + "Subscriber.c")
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
			MQTTClient_subscribe(client, "«sensor.name»", qos);
		}
		
		void «sensor.name»SubscriberUnsubscribe(MQTTClient client) {
			MQTTClient_unsubscribe(client, "«sensor.name»");
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
		
		int «sensor.name»MessageArrived(void *context, char *topicName, int topicLen, MQTTClient_message *message) {
			int i;
		    char* payloadptr;
		
		    printf("Message arrived\n");
		    printf("     topic: %s\n", topicName);
		    printf("   message: ");
		
		    payloadptr = message->payload;
		    for(i=0; i<message->payloadlen; i++)
		    {
		        putchar(*payloadptr++);
		    }
		    putchar('\n');
		    MQTTClient_freeMessage(&message);
		    MQTTClient_free(topicName);
		    return 1;
		}
		'''
		writer.write(fileContent)
		writer.close
	}
	
	private static def createPublisherHeaders(Sensor sensor, File srcFolder) {
		val publisherFile = createFile(srcFolder, sensor.name.toFirstUpper + "Publisher.h")
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
		
		#endif /* «sensor.name.toUpperCase»PUBLISHER_H_ */
		'''
		writer.write(fileContent)
		writer.close
	}
	
	private static def createPublisherSources(MqttSetup setup, Sensor sensor, File srcFolder) {
		val publisherFile = new File(srcFolder, sensor.name.toFirstUpper + "Publisher.c")
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
	
	private static def createMain(Sensor sensor, File srcFolder) {
		val mainFile = createFile(srcFolder, sensor.name.toFirstUpper + "Main.c")
		val writer = new FileWriter(mainFile)
		val fileContent = '''
		#include "«sensor.name»Publisher.h"
		#include "«sensor.name»Subscriber.h"
		
		«FOR message:sensor.messages»
		struct «message.name.toFirstUpper» {
			«FOR parameter:message.parameters»
			«IF parameter.type.name == "boolean"»
			int «parameter.name»;
			«ELSE»
			«parameter.type.name» «parameter.name»;
			«ENDIF»
			«ENDFOR»
		};

		«ENDFOR»
		int main(int argc, char* argv[])
		{
		    MQTTClient client;

			«sensor.name»SubscriberInit(&client);
			«sensor.name»SubscriberConnect(&client, 1);
			«sensor.name»SubscriberSubscribe(&client, 0);

			«sensor.name»PublisherInit(&client);
			«sensor.name»PublisherConnect(&client, 1);
			
			«FOR message:sensor.messages»
			struct «message.name.toFirstUpper» «message.name»;
			«FOR parameter:message.parameters»
			«IF parameter.type.name == "int"»
			«message.name».«parameter.name» = 10;
			«ELSEIF parameter.type.name == "boolean"»
			«message.name».«parameter.name» = 1;
			«ELSEIF parameter.type.name == "float"»
			«message.name».«parameter.name» = 10.5f;
			«ELSEIF parameter.type.name == "String"»
			«message.name».«parameter.name» = "Hello World!";
			«ENDIF»
			«ENDFOR»
			
			«sensor.name»PublisherPublishMessage(&client, &«message.name», «message.qos»);
			«ENDFOR»
			«sensor.name»PublisherDisconnect(&client);

			«sensor.name»SubscriberUnsubscribe(&client);
			«sensor.name»SubscriberDisconnect(&client);

			return 0;
		}
		'''
		writer.write(fileContent)
		writer.close
	}
	
}