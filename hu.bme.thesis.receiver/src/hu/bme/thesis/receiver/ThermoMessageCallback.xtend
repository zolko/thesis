package hu.bme.thesis.receiver

import com.fasterxml.jackson.databind.ObjectMapper
import hu.bme.thesis.receiver.pojos.ThermoMessage
import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken
import org.eclipse.paho.client.mqttv3.MqttCallback
import org.eclipse.paho.client.mqttv3.MqttMessage

class ThermoMessageCallback implements MqttCallback {
	
	override connectionLost(Throwable arg0) {
		throw new UnsupportedOperationException("Connection lost!")
	}
	
	override deliveryComplete(IMqttDeliveryToken arg0) {
		//println("Delivery completed!")
	}
	
	override messageArrived(String topic, MqttMessage message) throws Exception {
		val msg = new String(message.payload)
		val mapper = new ObjectMapper
		println("Get msg: " + msg)
		val thermoMessage = mapper.readValue(msg, ThermoMessage)
		println("temperature: " + thermoMessage.temperature)
	}
	
}