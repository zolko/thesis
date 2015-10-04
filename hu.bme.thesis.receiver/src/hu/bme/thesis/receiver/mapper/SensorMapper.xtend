package hu.bme.thesis.receiver.mapper

import de.undercouch.bson4jackson.BsonFactory
import hu.bme.thesis.receiver.Sensor
import java.io.ByteArrayOutputStream
import java.io.File
import java.io.FileOutputStream
import model.ModelFactory

class SensorMapper {

	BsonFactory factory

	new(BsonFactory factory) {
		this.factory = factory
	}

	def writeValueToFile(String path, Sensor sensor) {
		val file = new File(path)
		if (file == null) {
			file.createNewFile
		}
		val outputStream = new FileOutputStream(file)
		val baos = new ByteArrayOutputStream
		val generator = factory.createJsonGenerator(baos)
		generator.writeStartObject
		generator.writeFieldName("id")
		generator.writeString(sensor.id)
		generator.close

		baos.writeTo(outputStream)
	}
	
	def writeValueToModel(Sensor sensor) {
		val modelSensor = ModelFactory.eINSTANCE.createSensor
		modelSensor.id = sensor.id
	}

}