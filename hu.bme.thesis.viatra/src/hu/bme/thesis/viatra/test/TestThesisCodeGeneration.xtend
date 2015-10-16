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
		
		// Add sensor1 to model
		val sensor1 = modelFactory.createSensor
		val message1 = modelFactory.createMessage
		val parameter1 = modelFactory.createMessageParameter
		message1.parameters.add(parameter1)
		sensor1.name = "thermometer"
		sensor1.messages += message1
		
		resource.contents += setup
		resource.contents += sensor1
		resource.contents += message1
		resource.contents += parameter1
		
		val thesisCodeGeneration = new ThesisCodeGeneration
		
		thesisCodeGeneration.initialize(managedEngine)
		thesisCodeGeneration.fire
		thesisCodeGeneration.dispose
		
	}
	
}