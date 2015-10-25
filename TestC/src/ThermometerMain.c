#include "thermometerPublisher.h"
#include "thermometerSubscriber.h"

struct ThermoMessage {
	int temperature;
};
/*
struct BasicMessage {
	int powerOn;
};
*/

int main(int argc, char* argv[])
{
	MQTTClient publisherClient;
	/*
    MQTTClient subscriberClient;

	subscriberClient = thermometerSubscriberInit();
	thermometerSubscriberConnect(subscriberClient, 1);
	thermometerSubscriberSubscribe(subscriberClient, 1);
	*/
	publisherClient = thermometerPublisherInit();
	thermometerPublisherConnect(publisherClient, 1);
	
	struct ThermoMessage thermoMessage;
	thermoMessage.temperature = 10;
	char temperature[3];
	sprintf(temperature, "%d", thermoMessage.temperature);
	char message[100];
	sprintf(message, "{\"ThermoMessage\":{\"temperature\":%s}}", temperature);

	thermometerPublisherPublishMessage(publisherClient, message, 0);
	/*
	struct BasicMessage basicMessage;
	basicMessage.powerOn = 1;
	
	thermometerPublisherPublishMessage(publisherClient, &basicMessage, 0);
	*/
	thermometerPublisherDisconnect(publisherClient);
	thermometerPublisherDestroy(publisherClient);
	/*
	thermometerSubscriberUnsubscribe(subscriberClient);
	thermometerSubscriberDisconnect(subscriberClient);
	thermometerSubscriberDestroy(subscriberClient);
	*/
	return 0;
}
