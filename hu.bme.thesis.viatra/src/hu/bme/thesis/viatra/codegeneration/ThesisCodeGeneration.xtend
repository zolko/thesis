package hu.bme.thesis.viatra.codegeneration

import hu.bme.thesis.queries.Patterns
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationStatements
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation
import org.eclipse.incquery.runtime.api.IncQueryEngine
import hu.bme.thesis.viatra.rules.ThesisRuleProvider
import org.eclipse.incquery.runtime.api.GenericPatternGroup

class ThesisCodeGeneration {
	
	extension Patterns thesisQueries = Patterns.instance
	
	private var initialized = false
	
	extension BatchTransformationStatements statements
	
	BatchTransformation transform
	IncQueryEngine engine
	
	ThesisRuleProvider ruleProvider
	
	def initialize(IncQueryEngine engine) {
		if (!initialized) {
			this.engine = engine
			
			val queries = GenericPatternGroup.of(thesisQueries)
			queries.prepare(engine)
			
			transform = BatchTransformation.forEngine(engine)
			statements = new BatchTransformationStatements(transform)
			ruleProvider = new ThesisRuleProvider(engine, statements)
			ruleProvider.addRules(transform)
			
			initialized = true
		}
	}
	
	def fire() {
		fireAllCurrent(ruleProvider.sensorsRule)
	}
	
	def dispose() {
		transform?.dispose
	}
	
}