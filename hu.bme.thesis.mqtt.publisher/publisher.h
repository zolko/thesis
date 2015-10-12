#ifndef PUBLISHER_H_
#define PUBLISHER_H_

#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include "MQTTClient.h"

void init(MQTTClient client, char* brokerUrl, char* clientId);
void connect(MQTTClient client, int cleansession);
void publishMessage(MQTTClient client, char* topic, int qos, void* payload);
void disconnect(MQTTClient client);

#endif // PUBLISHER_H_