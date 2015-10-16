package hu.bme.thesis.receiver

import com.fasterxml.jackson.databind.ObjectMapper
import de.undercouch.bson4jackson.BsonFactory
import hu.bme.thesis.receiver.mqtt.Publisher
import hu.bme.thesis.receiver.pojos.Sensor
import java.io.ByteArrayOutputStream

class Main {
	
	public def static void main(String[] args) {
		val sensor = new Sensor()
		sensor.name = "123"
		
		val baos = new ByteArrayOutputStream
		val mapper = new ObjectMapper(new BsonFactory)
		mapper.writeValue(baos, sensor)
		
		val broker = "tcp://127.0.0.10:9876"
		val topic = "test"
		val publisher = new Publisher(broker, "PUBLISHER")
		val receiver = new Receiver(broker, "RECEIVER")
		
		publisher.connect
		receiver.subscribe(topic)
		
		publisher.publish(topic, baos.toByteArray)
	}
	
}