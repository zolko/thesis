/*
 * generated by Xtext 2.9.0.beta5
 */
package hu.bme.thesis.dsl.rules.scoping

import hu.bme.thesis.dsl.rules.ruleDsl.Rule
import org.eclipse.emf.ecore.EReference
import org.eclipse.xtext.scoping.impl.AbstractDeclarativeScopeProvider

import static org.eclipse.xtext.scoping.Scopes.*

/**
 * This class contains custom scoping description.
 * 
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#scoping
 * on how and when to use it.
 */
class RuleDslScopeProvider extends AbstractDeclarativeScopeProvider {

	def scope_Rule_message(Rule rule, EReference ref) {
		scopeFor(rule.sensor.messages)
	}
	
	def scope_Rule_param(Rule rule, EReference ref) {
		scopeFor(rule.message.parameters)
	}

}