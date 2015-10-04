package hu.bme.thesis.receiver.mqtt

import org.eclipse.paho.client.mqttv3.MqttClient
import org.eclipse.paho.client.mqttv3.MqttConnectOptions

class Subscriber {
	
	protected MqttClient client
	protected MqttConnectOptions connOpts
	
	new(String brokerAddress, String clientId) {
		client = new MqttClient(brokerAddress, clientId)
		connOpts = new MqttConnectOptions
		connOpts.cleanSession = true
	}
	
	def subscribe(String topic) {
		client.connect(connOpts)
		client.subscribe(topic)
	}
	
	def subscribe(String[] topics) {
		client.connect(connOpts)
		client.subscribe(topics)
	}
	
	def unsubscribe(String topic) {
		client.unsubscribe(topic)
	}
	
	def unsubscribe(String[] topics) {
		client.unsubscribe(topics)
	}
	
	def disconnect() {
		client.disconnect
	}
	
}