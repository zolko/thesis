package hu.bme.thesis.receiver

import hu.bme.thesis.receiver.mqtt.Subscriber

class CtoPojosTest {
	public def static void main(String[] args) {
		val subscriber = new Subscriber("tcp://127.0.0.10:9876", "SUBSCRIBER_CLIENT");
		val thermoCallback = new ThermoMessageCallback
		subscriber.connect
		subscriber.callback = thermoCallback
		subscriber.subscribe("thermometer")
		while(true) {
			
		}
	}
	
}