#include "thermoMeterPublisher.h"
#include "thermoMeterSubscriber.h"

int main(int argc, char* argv[])
{
	MQTTClient publisherClient;
    MQTTClient subscriberClient;

	subscriberClient = thermoMeterSubscriberInit();
	thermoMeterSubscriberConnect(subscriberClient, 1);
	thermoMeterSubscriberSubscribe(subscriberClient, 1);

	publisherClient = thermoMeterPublisherInit();
	thermoMeterPublisherConnect(publisherClient, 1);
	
	ThermoMessage thermoMessage;
	thermoMessage.temperature = 10.5f;
	
	thermoMeterPublisherPublishThermoMessage(publisherClient, thermoMessage, 0);
	
	BasicSensorMessage basicSensorMessage;
	basicSensorMessage.powerOn = 1;
	
	thermoMeterPublisherPublishBasicSensorMessage(publisherClient, basicSensorMessage, 0);
	
	thermoMeterPublisherDisconnect(publisherClient);
	thermoMeterPublisherDestroy(publisherClient);

	thermoMeterSubscriberUnsubscribe(subscriberClient);
	thermoMeterSubscriberDisconnect(subscriberClient);
	thermoMeterSubscriberDestroy(subscriberClient);

	return 0;
}
