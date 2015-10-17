package hu.bme.thesis.dsl.viatra

import hu.bme.thesis.dsl.queries.Patterns
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.viatra.emf.runtime.rules.BatchTransformationRuleGroup
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationStatements
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation
import org.eclipse.xtend.lib.annotations.Accessors

class RuleProvider {
	
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
		println('''Sensor id: «match.sensor.name»''')
	].build
	
	@Accessors(PUBLIC_GETTER)
	val modelRule = createRule.precondition(model).action[ match |
		for (sensor : match.model.sensors) {
			CGenerator.generateCFiles(match.model.mqttSetup, sensor, "")
			JavaGenerator.generateJavaFiles(match.model.mqttSetup, sensor, "")
			//createSubscriber(match.model.mqttSetup, sensor)
		}
	].build
	
	public def addRules(BatchTransformation transformation) {
		val rules = new BatchTransformationRuleGroup(
			sensorsRule,
			modelRule
		)
		
		transformation.addRules(rules)
	}
	
}