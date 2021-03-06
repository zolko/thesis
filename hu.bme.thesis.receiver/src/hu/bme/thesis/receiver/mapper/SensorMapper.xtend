package hu.bme.thesis.receiver.mapper

import com.fasterxml.jackson.databind.ObjectMapper
import de.undercouch.bson4jackson.BsonFactory
import hu.bme.thesis.model.Message
import hu.bme.thesis.model.ModelFactory
import hu.bme.thesis.receiver.pojos.Sensor
import java.io.ByteArrayInputStream
import java.io.ByteArrayOutputStream
import java.io.File
import java.io.FileOutputStream
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.emf.ecore.xmi.impl.XMIResourceFactoryImpl

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
		generator.writeString(sensor.name)
		generator.close

		baos.writeTo(outputStream)
	}
	
	def addValueToModel(byte[] bytes) {
		val bais = new ByteArrayInputStream(bytes)
		val mapper = new ObjectMapper(factory)
		val contents = resource.contents
		for (content : contents) {
			if (content instanceof hu.bme.thesis.model.Sensor) {
				content.messages.add(mapper.readValue(bais, Message))
			}
		}
	}

}