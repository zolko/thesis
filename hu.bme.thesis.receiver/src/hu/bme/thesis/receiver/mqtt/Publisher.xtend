package hu.bme.thesis.receiver.mqtt

import org.eclipse.paho.client.mqttv3.MqttClient
import org.eclipse.paho.client.mqttv3.MqttConnectOptions
import org.eclipse.paho.client.mqttv3.MqttMessage
import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence

class Publisher {
	
	protected MqttClient client
	protected MqttConnectOptions connOpts
	MemoryPersistence persistance
	
	new(String broker, String clientId) {
		client = new MqttClient(broker, clientId, persistance)
		connOpts = new MqttConnectOptions
		connOpts.cleanSession = true
	}
	
	def connect() {
		client.connect(connOpts)
	}
	
	def publish(String topic, byte[] payload) {
		val message = new MqttMessage(payload)
		message.qos = 0
		message.retained = false
		client.publish(topic, message)
	}
	
	def disconnect() {
		client.disconnect
	}
	
}