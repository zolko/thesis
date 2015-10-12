#include "publisher.h"


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