package hu.bme.thesis.receiver.mapper

import de.undercouch.bson4jackson.BsonFactory
import hu.bme.thesis.model.ModelFactory
import hu.bme.thesis.receiver.Sensor
import java.io.ByteArrayOutputStream
import java.io.File
import java.io.FileOutputStream
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.emf.ecore.xmi.impl.XMIResourceFactoryImpl
import com.fasterxml.jackson.core.JsonToken

class SensorMapper {

	BsonFactory factory
	Resource resource

	new(BsonFactory factory) {
		this.factory = factory
		val reg = Resource.Factory.Registry.INSTANCE;
		val m = reg.getExtensionToFactoryMap();
        m.put("model", new XMIResourceFactoryImpl());
        val resourceSet = new ResourceSetImpl();
        resource = resourceSet.createResource(URI.createURI("model/thesis.model"));
		
		val modelSensor = ModelFactory.eINSTANCE.createSensor
		val message = ModelFactory.eINSTANCE.createMessage
		modelSensor.messages.add(message)
		
		resource.contents.add(modelSensor)
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
		val modelSensor = resource.contents.get(0) as hu.bme.thesis.model.Sensor
		modelSensor.id = sensor.id
		val message = ModelFactory.eINSTANCE.createMessage
		message.contents.add("Content")
		modelSensor.messages.add(message)
	}
	
	def addValueToModel(byte[] bytes) {
		val parser = factory.createParser(bytes)
		val sensor = ModelFactory.eINSTANCE.createSensor
		parser.nextToken
		while (parser.nextToken != JsonToken.END_OBJECT) {
			val fieldname = parser.currentName
			parser.nextToken
			if (fieldname.equals("id")) {
				sensor.id = parser.text
			}
		}
	}

}