package hu.bme.thesis.receiver

import de.undercouch.bson4jackson.BsonFactory
import hu.bme.thesis.receiver.mapper.SensorMapper
import hu.bme.thesis.receiver.mqtt.Subscriber
import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken
import org.eclipse.paho.client.mqttv3.MqttCallback
import org.eclipse.paho.client.mqttv3.MqttMessage

class Receiver extends Subscriber implements MqttCallback {
	
	BsonFactory factory = new BsonFactory
	
	new(String brokerAddress, String clientId) {
		super(brokerAddress, clientId)
		client.callback = this
	}
	
	override connectionLost(Throwable arg0) {
		throw new UnsupportedOperationException("Connection lost!")
	}
	
	override deliveryComplete(IMqttDeliveryToken arg0) {
		//println("Delivery completed!")
	}
	
	override messageArrived(String topic, MqttMessage message) throws Exception {
		val mapper = new SensorMapper(factory)
		mapper.addValueToModel(message.payload)
	}
	
}