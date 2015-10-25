#ifndef THERMOMETERPUBLISHER_H_
#define THERMOMETERPUBLISHER_H_

#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include "MQTTClient.h"

MQTTClient thermometerPublisherInit();
void thermometerPublisherConnect(MQTTClient client, int cleansession);
void thermometerPublisherPublishMessage(MQTTClient client, void* payload, int qos);
void thermometerPublisherDisconnect(MQTTClient client);
void thermometerPublisherDestroy(MQTTClient client);

#endif /* THERMOMETERPUBLISHER_H_ */
