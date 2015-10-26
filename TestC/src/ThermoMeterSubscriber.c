#include "thermoMeterSubscriber.h"

volatile MQTTClient_deliveryToken deliveredtoken;

MQTTClient thermoMeterSubscriberInit() {
	MQTTClient client;
	MQTTClient_create(&client, "tcp://127.0.0.10:9876", "THERMOMETER_SUBSCRIBER", MQTTCLIENT_PERSISTENCE_NONE, NULL);
	return client;
}

void thermoMeterSubscriberConnect(MQTTClient client, int cleansession) {
	MQTTClient_connectOptions conn_opts = MQTTClient_connectOptions_initializer;
	conn_opts.cleansession = cleansession;
	MQTTClient_setCallbacks(client, NULL, thermoMessageConnLost, thermoMessageMessageArrived, thermoMessageDelivered);
	MQTTClient_setCallbacks(client, NULL, basicSensorMessageConnLost, basicSensorMessageMessageArrived, basicSensorMessageDelivered);
	MQTTClient_connect(client, &conn_opts);
}

void thermoMeterSubscriberSubscribe(MQTTClient client, int qos) {
	MQTTClient_subscribe(client, "thermoMeter", qos);
}

void thermoMeterSubscriberUnsubscribe(MQTTClient client) {
	MQTTClient_unsubscribe(client, "thermoMeter");
}

void thermoMeterSubscriberDisconnect(MQTTClient client) {
	MQTTClient_disconnect(client, 1000L);
}

void thermoMeterSubscriberDestroy(MQTTClient client) {
	MQTTClient_destroy(&client);
}

void thermoMessageConnLost(void *context, char *cause) {
	printf("\nConnection lost\n");
	printf("     cause: %s\n", cause);
}

void thermoMessageDelivered(void *context, MQTTClient_deliveryToken dt) {
	printf("Message with token value %d delivery confirmed\n", dt);
	deliveredtoken = dt;
}

int thermoMessageMessageArrived(void *context, char *topicName, int topicLen, MQTTClient_message *message) {
	ThermoMessage* payload;
	payload = (ThermoMessage*)message->payload;

	printf("Message arrived\n");
	printf("     topic: %s\n", topicName);
	printf("   message: %f\n", payload->temperature);
	MQTTClient_freeMessage(&message);
	MQTTClient_free(topicName);

	return 1;
}

void basicSensorMessageConnLost(void *context, char *cause) {
	printf("\nConnection lost\n");
	printf("     cause: %s\n", cause);
}

void basicSensorMessageDelivered(void *context, MQTTClient_deliveryToken dt) {
	printf("Message with token value %d delivery confirmed\n", dt);
	deliveredtoken = dt;
}

int basicSensorMessageMessageArrived(void *context, char *topicName, int topicLen, MQTTClient_message *message) {
	BasicSensorMessage* payload;
	payload = (BasicSensorMessage*)message->payload;

	printf("Message arrived\n");
	printf("     topic: %s\n", topicName);
	printf("   message: %d\n", payload->powerOn);
	MQTTClient_freeMessage(&message);
	MQTTClient_free(topicName);

	return 1;
}
