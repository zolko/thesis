package hu.bme.thesis.receiver.pojos

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

class Message extends Type {
	
	@Accessors List<MessageParameter> parameters
	@Accessors int qos
	
}