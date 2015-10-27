/*
 * generated by Xtext 2.9.0.beta5
 */
package org.eclipse.viatra.cep.mqtt.midl.validation

import org.eclipse.viatra.cep.mqtt.midl.mIDL.BooleanCriteria
import org.eclipse.viatra.cep.mqtt.midl.mIDL.BooleanLiteral
import org.eclipse.viatra.cep.mqtt.midl.mIDL.DataParameter
import org.eclipse.viatra.cep.mqtt.midl.mIDL.FloatCriteria
import org.eclipse.viatra.cep.mqtt.midl.mIDL.FloatLiteral
import org.eclipse.viatra.cep.mqtt.midl.mIDL.IntCriteria
import org.eclipse.viatra.cep.mqtt.midl.mIDL.IntLiteral
import org.eclipse.viatra.cep.mqtt.midl.mIDL.StringCriteria
import org.eclipse.viatra.cep.mqtt.midl.mIDL.StringLiteral
import org.eclipse.xtext.validation.Check
import org.eclipse.viatra.cep.mqtt.midl.mIDL.MIDLPackage

//import org.eclipse.xtext.validation.Check

/**
 * This class contains custom validation rules. 
 *
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#validation
 */
class MIDLValidator extends AbstractMIDLValidator {
	
	@Check
	def checkParameterValueIsValid(DataParameter dataParameter) {
		if (dataParameter.value != null) {
			if (dataParameter.type.name == "int" && !(dataParameter.value instanceof IntLiteral)) {
				error("The value must be int type", MIDLPackage.Literals.DATA_PARAMETER__VALUE, "invalidValue")
			} else if (dataParameter.type.name == "float" && !(dataParameter.value instanceof FloatLiteral)) {
				error("The value must be float type", MIDLPackage.Literals.DATA_PARAMETER__VALUE, "invalidValue")
			} else if (dataParameter.type.name == "boolean" && !(dataParameter.value instanceof BooleanLiteral)) {
				error("The value must be boolean type", MIDLPackage.Literals.DATA_PARAMETER__VALUE, "invalidValue")
			} else if (dataParameter.type.name == "String" && !(dataParameter.value instanceof StringLiteral)) {
				error("The value must be String type", MIDLPackage.Literals.DATA_PARAMETER__VALUE, "invalidValue")
			}
		}
	}
	
	@Check
	def checkParameterCriteriaType(DataParameter dataParameter) {
		if (!dataParameter.criteria.empty) {
			for (crit : dataParameter.criteria) {
				if (dataParameter.type.name == "int" && !(crit.critValue instanceof IntCriteria)) {
					error("The criteria must be int type", MIDLPackage.Literals.DATA_PARAMETER__CRITERIA, "invalidCriteria")
				} else if (dataParameter.type.name == "float" && !(crit.critValue instanceof FloatCriteria)) {
					error("The criteria must be float type", MIDLPackage.Literals.DATA_PARAMETER__CRITERIA, "invalidCriteria")
				} else if (dataParameter.type.name == "boolean" && !(crit.critValue instanceof BooleanCriteria)) {
					error("The criteria must be boolean type", MIDLPackage.Literals.DATA_PARAMETER__CRITERIA, "invalidCriteria")
				} else if (dataParameter.type.name == "String" && !(crit.critValue instanceof StringCriteria)) {
					error("The criteria must be String type", MIDLPackage.Literals.DATA_PARAMETER__CRITERIA, "invalidCriteria")
				}
			}
		}
	}
	
}
