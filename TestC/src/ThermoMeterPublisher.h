#ifndef THERMOMETERPUBLISHER_H_
#define THERMOMETERPUBLISHER_H_

#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include "MQTTClient.h"
#include "thermoMeterMessages.h"

MQTTClient thermoMeterPublisherInit();
void thermoMeterPublisherConnect(MQTTClient client, int cleansession);
void thermoMeterPublisherPublishThermoMessage(MQTTClient client, ThermoMessage thermoMessage, int qos);
void thermoMeterPublisherPublishBasicSensorMessage(MQTTClient client, BasicSensorMessage basicSensorMessage, int qos);
void thermoMeterPublisherDisconnect(MQTTClient client);
void thermoMeterPublisherDestroy(MQTTClient client);

#endif /* THERMOMETERPUBLISHER_H_ */
