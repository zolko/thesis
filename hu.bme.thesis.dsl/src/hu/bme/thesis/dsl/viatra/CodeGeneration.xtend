package hu.bme.thesis.dsl.viatra

import hu.bme.thesis.dsl.queries.Patterns
import org.eclipse.incquery.runtime.api.GenericPatternGroup
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationStatements
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation

class CodeGeneration {
	
	extension Patterns thesisQueries = Patterns.instance
	
	private var initialized = false
	
	extension BatchTransformationStatements statements
	
	BatchTransformation transform
	IncQueryEngine engine
	
	RuleProvider ruleProvider
	
	def initialize(IncQueryEngine engine) {
		if (!initialized) {
			this.engine = engine
			
			val queries = GenericPatternGroup.of(thesisQueries)
			queries.prepare(engine)
			
			transform = BatchTransformation.forEngine(engine)
			statements = new BatchTransformationStatements(transform)
			ruleProvider = new RuleProvider(engine, statements)
			ruleProvider.addRules(transform)
			
			initialized = true
		}
	}
	
	def fire() {
		fireAllCurrent(ruleProvider.sensorsRule)
		fireAllCurrent(ruleProvider.modelRule)
		ruleProvider.generateGeneralSubscriber
	}
	
	def dispose() {
		transform?.dispose
	}
	
}