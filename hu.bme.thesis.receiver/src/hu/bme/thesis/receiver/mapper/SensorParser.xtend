package hu.bme.thesis.receiver.mapper

import com.fasterxml.jackson.core.JsonFactory
import java.io.ByteArrayInputStream
import java.io.File
import org.apache.commons.io.FileUtils
import hu.bme.thesis.receiver.Sensor
import com.fasterxml.jackson.core.JsonToken

class SensorParser {

	JsonFactory factory

	new(JsonFactory factory) {
		this.factory = factory
	}

	def readValueFromFile(String path) {
		val file = new File(path)
		val bais = new ByteArrayInputStream(FileUtils.readFileToByteArray(file))
		val parser = factory.createParser(bais)
		val clone_sensor = new Sensor
		parser.nextToken
		while (parser.nextToken != JsonToken.END_OBJECT) {
			val fieldname = parser.currentName
			parser.nextToken
			if ("id".equals(fieldname)) {
				clone_sensor.id = parser.text
			}
		}
		
		clone_sensor
	}
	
	def readValueFromBytes(byte[] bytes) {
		val parser = factory.createParser(bytes)
		val sensor = new Sensor
		parser.nextToken
		while (parser.nextToken != JsonToken.END_OBJECT) {
			val fieldname = parser.currentName
			parser.nextToken
			if ("id".equals(fieldname)) {
				sensor.id = parser.text
			}
		}
		sensor
	}

}