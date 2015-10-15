/*
 * generated by Xtext 2.9.0.beta5
 */
package hu.bme.thesis.dsl.formatting2

import com.google.inject.Inject
import hu.bme.thesis.dsl.sensorDsl.Model
import hu.bme.thesis.dsl.sensorDsl.Sensor
import hu.bme.thesis.dsl.services.SensorDslGrammarAccess
import org.eclipse.xtext.formatting2.AbstractFormatter2
import org.eclipse.xtext.formatting2.IFormattableDocument

class SensorDslFormatter extends AbstractFormatter2 {
	
	@Inject extension SensorDslGrammarAccess

	def dispatch void format(Model model, extension IFormattableDocument document) {
		// TODO: format HiddenRegions around keywords, attributes, cross references, etc. 
		for (Sensor sensors : model.getSensors()) {
			format(sensors, document);
		}
		format(model.getMqttSetup(), document);
	}

	def dispatch void format(Sensor sensor, extension IFormattableDocument document) {
		// TODO: format HiddenRegions around keywords, attributes, cross references, etc. 
		format(sensor.getMessages(), document);
	}
}
