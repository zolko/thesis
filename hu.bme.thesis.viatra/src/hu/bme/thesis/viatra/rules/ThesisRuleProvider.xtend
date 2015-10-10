package hu.bme.thesis.viatra.rules

import hu.bme.thesis.queries.Patterns
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRuleFactory
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationStatements
import org.eclipse.xtend.lib.annotations.Accessors
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation
import org.eclipse.viatra.emf.runtime.rules.BatchTransformationRuleGroup

class ThesisRuleProvider {
	
	static extension val Patterns codeGenQueries = Patterns.instance
	
	extension val BatchTransformationRuleFactory factory = new BatchTransformationRuleFactory
	
	IncQueryEngine engine
	
	extension BatchTransformationStatements statements
	
	new(IncQueryEngine engine, BatchTransformationStatements statements) {
		this.engine = engine
		this.statements = statements
	}
	
	@Accessors(PUBLIC_GETTER)
	val sensorsRule = createRule.precondition(sensors).action[ match |
		println('''Sensor id: «match.sensor.id»''')
	].build
	
	public def addRules(BatchTransformation transformation) {
		val rules = new BatchTransformationRuleGroup(
			sensorsRule
		)
		
		transformation.addRules(rules)
	}
	
}