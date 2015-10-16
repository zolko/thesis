package hu.bme.thesis.receiver.pojos

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

class Sensor {
	
	@Accessors String name
	@Accessors List<Message> messages
	
}