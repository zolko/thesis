package hu.bme.thesis.receiver

import de.undercouch.bson4jackson.BsonFactory
import hu.bme.thesis.receiver.mqtt.Subscriber
import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken
import org.eclipse.paho.client.mqttv3.MqttCallback
import org.eclipse.paho.client.mqttv3.MqttMessage
import hu.bme.thesis.receiver.mapper.SensorParser
import hu.bme.thesis.receiver.mapper.SensorMapper

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
		val parser = new SensorParser(factory)
		val mapper = new SensorMapper(factory)
		val sensor = parser.readValueFromBytes(message.payload)
		println("-------------------------------------")
		println("| Topic:" + topic)
		println("| Sensor ID:" + sensor.id)
		println("-------------------------------------")
		mapper.writeValueToModel(sensor)
	}
	
}