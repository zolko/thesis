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
		
		val sensor1 = modelFactory.createSensor
		val message1 = modelFactory.createMessage
		message1.contents += "Message1"
		sensor1.id = "123"
		sensor1.messages += message1
		
		val sensor2 = modelFactory.createSensor
		val message2 = modelFactory.createMessage
		message2.contents += "Message2"
		val message3 = modelFactory.createMessage
		message3.contents += "Message3"
		message2.contents += message3
		sensor2.id = "987"
		sensor2.messages += message2
		
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