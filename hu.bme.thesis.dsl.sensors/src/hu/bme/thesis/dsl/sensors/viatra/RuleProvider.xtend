package hu.bme.thesis.dsl.sensors.viatra

import hu.bme.thesis.dsl.sensors.queries.Patterns
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.viatra.emf.runtime.rules.BatchTransformationRuleGroup
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationStatements
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation
import org.eclipse.xtend.lib.annotations.Accessors

class RuleProvider {
	
	static extension val Patterns codeGenQueries = Patterns.instance
	extension val BatchTransformationRuleFactory factory = new BatchTransformationRuleFactory
	extension BatchTransformationStatements statements
	
	IncQueryEngine engine
	String rootPath
	
	new(IncQueryEngine engine, BatchTransformationStatements statements, String rootPath) {
		this.engine = engine
		this.statements = statements
		this.rootPath = rootPath
		JavaGenerator.generateGeneralSubscriber(rootPath)
		CGenerator.generateProjectFile(rootPath)
		CGenerator.generateCProjectFile(rootPath)
	}
	
	@Accessors(PUBLIC_GETTER)
	val sensorsRule = createRule.precondition(sensors).action[ match |
		println('''Sensor id: «match.sensor.name»''')
	].build
	
	@Accessors(PUBLIC_GETTER)
	val modelRule = createRule.precondition(model).action[ match |
		for (sensor : match.model.sensors) {
			CGenerator.generateCFiles(match.model.mqttSetup, sensor, rootPath)
			JavaGenerator.generateJavaFiles(match.model.mqttSetup, sensor, rootPath)
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