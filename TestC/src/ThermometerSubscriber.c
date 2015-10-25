#include "thermometerSubscriber.h"

volatile MQTTClient_deliveryToken deliveredtoken;

struct ThermoMessage {
	int temperature;
};
struct BasicMessage {
	int powerOn;
};

MQTTClient thermometerSubscriberInit() {
	MQTTClient client;
	MQTTClient_create(&client, "tcp://127.0.0.10:9876", "THERMOMETER_SUBSCRIBER", MQTTCLIENT_PERSISTENCE_NONE, NULL);
	return client;
}

void thermometerSubscriberConnect(MQTTClient client, int cleansession) {
	MQTTClient_connectOptions conn_opts = MQTTClient_connectOptions_initializer;
	conn_opts.cleansession = cleansession;
	MQTTClient_setCallbacks(client, NULL, thermoMessageConnLost, thermoMessageMessageArrived, thermoMessageDelivered);
	MQTTClient_setCallbacks(client, NULL, basicMessageConnLost, basicMessageMessageArrived, basicMessageDelivered);
	MQTTClient_connect(client, &conn_opts);
}

void thermometerSubscriberSubscribe(MQTTClient client, int qos) {
	MQTTClient_subscribe(client, "thermometer", qos);
}

void thermometerSubscriberUnsubscribe(MQTTClient client) {
	MQTTClient_unsubscribe(client, "thermometer");
}

void thermometerSubscriberDisconnect(MQTTClient client) {
	MQTTClient_disconnect(client, 1000L);
}

void thermometerSubscriberDestroy(MQTTClient client) {
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
	struct ThermoMessage* payload;
	payload = (struct ThermoMessage*)message->payload;

	printf("Message arrived\n");
	printf("     topic: %s\n", topicName);
	printf("	message: %d\n", payload->temperature);
	MQTTClient_freeMessage(&message);
	MQTTClient_free(topicName);

	return 1;
}

void basicMessageConnLost(void *context, char *cause) {
	printf("\nConnection lost\n");
	printf("     cause: %s\n", cause);
}

void basicMessageDelivered(void *context, MQTTClient_deliveryToken dt) {
	printf("Message with token value %d delivery confirmed\n", dt);
	deliveredtoken = dt;
}

int basicMessageMessageArrived(void *context, char *topicName, int topicLen, MQTTClient_message *message) {
	struct BasicMessage* payload;
	payload = (struct BasicMessage*)message->payload;

	printf("Message arrived\n");
	printf("     topic: %s\n", topicName);
	printf("	message: %d\n", payload->powerOn);
	MQTTClient_freeMessage(&message);
	MQTTClient_free(topicName);

	return 1;
}
