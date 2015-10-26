#ifndef THERMOMETERSUBSCRIBER_H_
#define THERMOMETERSUBSCRIBER_H_

#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include "MQTTClient.h"
#include "thermoMeterMessages.h"

MQTTClient thermoMeterSubscriberInit();
void thermoMeterSubscriberConnect(MQTTClient client, int cleansession);
void thermoMeterSubscriberSubscribe(MQTTClient client, int qos);
void thermoMeterSubscriberUnsubscribe(MQTTClient client);
void thermoMeterSubscriberDisconnect(MQTTClient client);
void thermoMeterSubscriberDestroy(MQTTClient client);
void thermoMessageConnLost(void *context, char *cause);
void thermoMessageDelivered(void *context, MQTTClient_deliveryToken dt);
int thermoMessageMessageArrived(void *context, char *topicName, int topicLen, MQTTClient_message *message);
void basicSensorMessageConnLost(void *context, char *cause);
void basicSensorMessageDelivered(void *context, MQTTClient_deliveryToken dt);
int basicSensorMessageMessageArrived(void *context, char *topicName, int topicLen, MQTTClient_message *message);

#endif /* THERMOMETERSUBSCRIBER_H_ */
