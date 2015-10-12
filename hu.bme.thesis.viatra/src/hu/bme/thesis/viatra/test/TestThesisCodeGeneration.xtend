package hu.bme.thesis.viatra.test

import hu.bme.thesis.model.ModelFactory
import org.junit.Test
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.emf.common.util.URI
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFScope
import hu.bme.thesis.viatra.codegeneration.ThesisCodeGeneration

public class TestThesisCodeGeneration {
	
	static extension val ModelFactory modelFactory = ModelFactory.eINSTANCE
	
	@Test
	def test() {
		val resourceSet = new ResourceSetImpl
		
		val resource = resourceSet.createResource(URI.createURI("thesisURI"))
		val managedEngine = IncQueryEngine.on(new EMFScope(resourceSet))
		
		// Add MqttSetup to model
		val setup = modelFactory.createMqttSetup
		setup.brokerUrl = "tcp://127.0.0.10:9876"
		setup.qos = 0
		setup.subscriberId = "SUBSCRIBER"
		
		// Add sensor1 to model
		val sensor1 = modelFactory.createSensor
		val message1 = modelFactory.createMessage
		message1.contents += "Message1"
		sensor1.id = "thermometer"
		sensor1.messages += message1
		
		// Add sensor2 to model
		val sensor2 = modelFactory.createSensor
		val message2 = modelFactory.createMessage
		message2.contents += "Message2"
		val message3 = modelFactory.createMessage
		message3.contents += "Message3"
		message2.contents += message3
		sensor2.id = "switch"
		sensor2.messages += message2
		
		resource.contents += setup
		resource.contents += sensor1
		resource.contents += sensor2
		resource.contents += message1
		resource.contents += message2
		resource.contents += message3
		
		val thesisCodeGeneration = new ThesisCodeGeneration
		
		thesisCodeGeneration.initialize(managedEngine)
		thesisCodeGeneration.fire
		thesisCodeGeneration.dispose
		
	}
	
}