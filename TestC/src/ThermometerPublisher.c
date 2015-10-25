#include "thermometerPublisher.h"

MQTTClient thermometerPublisherInit() {
	MQTTClient client;
	MQTTClient_create(&client, "tcp://127.0.0.10:9876", "THERMOMETER_PUBLISHER", MQTTCLIENT_PERSISTENCE_NONE, NULL);
	return client;
}

void thermometerPublisherConnect(MQTTClient client, int cleansession) {
	MQTTClient_connectOptions conn_opts = MQTTClient_connectOptions_initializer;
	conn_opts.cleansession = cleansession;
	MQTTClient_connect(client, &conn_opts);
}

void thermometerPublisherPublishMessage(MQTTClient client, void* payload, int qos) {
	MQTTClient_deliveryToken token;
	MQTTClient_message message = MQTTClient_message_initializer;
	message.payload = payload;
	message.payloadlen = strlen(payload);
	message.qos = qos;
	message.retained = 0;
	MQTTClient_publishMessage(client, "thermometer", &message, &token);
	MQTTClient_waitForCompletion(client, token, 10000L);
}

void thermometerPublisherDisconnect(MQTTClient client) {
	MQTTClient_disconnect(client, 1000L);
}

void thermometerPublisherDestroy(MQTTClient client) {
	MQTTClient_destroy(&client);
}
