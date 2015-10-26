#include "thermoMeterPublisher.h"

MQTTClient thermoMeterPublisherInit() {
	MQTTClient client;
	MQTTClient_create(&client, "tcp://127.0.0.10:9876", "THERMOMETER_PUBLISHER", MQTTCLIENT_PERSISTENCE_NONE, NULL);
	return client;
}

void thermoMeterPublisherConnect(MQTTClient client, int cleansession) {
	MQTTClient_connectOptions conn_opts = MQTTClient_connectOptions_initializer;
	conn_opts.cleansession = cleansession;
	MQTTClient_connect(client, &conn_opts);
}

void thermoMeterPublisherPublishThermoMessage(MQTTClient client, ThermoMessage thermoMessage, int qos) {
	MQTTClient_deliveryToken token;
	MQTTClient_message message = MQTTClient_message_initializer;
	
	char payload[100] = "{";
	char temperature[11];
	sprintf(temperature, "%f", thermoMessage.temperature);
	strcat(payload, "\"temperature\":");
	strcat(payload, temperature);
	strcat(payload, "}");
	
	message.payload = payload;
	message.payloadlen = strlen(payload);
	message.qos = qos;
	message.retained = 0;
	MQTTClient_publishMessage(client, "thermoMeter", &message, &token);
	MQTTClient_waitForCompletion(client, token, 10000L);
}

void thermoMeterPublisherPublishBasicSensorMessage(MQTTClient client, BasicSensorMessage basicSensorMessage, int qos) {
	MQTTClient_deliveryToken token;
	MQTTClient_message message = MQTTClient_message_initializer;
	
	char payload[100] = "{";
	char powerOn[7];
	sprintf(powerOn, "%d", basicSensorMessage.powerOn);
	strcat(payload, "\"powerOn\":");
	strcat(payload, powerOn);
	strcat(payload, "}");
	
	message.payload = payload;
	message.payloadlen = strlen(payload);
	message.qos = qos;
	message.retained = 0;
	MQTTClient_publishMessage(client, "thermoMeter", &message, &token);
	MQTTClient_waitForCompletion(client, token, 10000L);
}

void thermoMeterPublisherDisconnect(MQTTClient client) {
	MQTTClient_disconnect(client, 1000L);
}

void thermoMeterPublisherDestroy(MQTTClient client) {
	MQTTClient_destroy(&client);
}
