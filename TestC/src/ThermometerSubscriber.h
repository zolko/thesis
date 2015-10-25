#ifndef THERMOMETERSUBSCRIBER_H_
#define THERMOMETERSUBSCRIBER_H_

#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include "MQTTClient.h"

MQTTClient thermometerSubscriberInit();
void thermometerSubscriberConnect(MQTTClient client, int cleansession);
void thermometerSubscriberSubscribe(MQTTClient client, int qos);
void thermometerSubscriberUnsubscribe(MQTTClient client);
void thermometerSubscriberDisconnect(MQTTClient client);
void thermometerSubscriberDestroy(MQTTClient client);
void thermoMessageConnLost(void *context, char *cause);
void thermoMessageDelivered(void *context, MQTTClient_deliveryToken dt);
int thermoMessageMessageArrived(void *context, char *topicName, int topicLen, MQTTClient_message *message);
void basicMessageConnLost(void *context, char *cause);
void basicMessageDelivered(void *context, MQTTClient_deliveryToken dt);
int basicMessageMessageArrived(void *context, char *topicName, int topicLen, MQTTClient_message *message);

#endif /* THERMOMETERSUBSCRIBER_H_ */
