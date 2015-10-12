#include "publisher.h"

int main(int argc, char* argv[])
{
    MQTTClient client;
	
	init(&client, "tcp://127.0.0.10:9875", "ExampleClientPub");
	connect(&client, 1);
	char* payload = "Hello World!";
	publishMessage(&client, "MQTT Examples", 0, payload);
	disconnect(&client);
	
    return 0;
}