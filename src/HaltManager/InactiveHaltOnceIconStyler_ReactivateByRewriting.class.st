Class {
	#name : #'InactiveHaltOnceIconStyler_ReactivateByRewriting',
	#superclass : #ReactivateByRewritingStyler,
	#category : #'HaltManager-Stylers'
}

{ #category : #defaults }
InactiveHaltOnceIconStyler_ReactivateByRewriting >> iconBlock: aNode [
	^ self iconBlock: aNode forSelector: #haltOnce

]

{ #category : #defaults }
InactiveHaltOnceIconStyler_ReactivateByRewriting >> iconBlock_old: aNode [
	^[ :textSegmentMorph | 
		|rewriter newSourceCode methodNode methodClass compiledMethod methodParseTree|
		rewriter := RBParseTreeRewriter new.
		rewriter replace: 'self inactiveHalt' with: 'self halt' when: [:node| node == aNode].
		methodNode := aNode methodNode.
		methodClass := methodNode methodClass.
		compiledMethod := methodClass >>((methodNode selector) asSymbol).
		"methodParseTree := compiledMethod parseTree."
		methodParseTree := compiledMethod ast.
		rewriter executeTree: methodParseTree.
		newSourceCode := methodParseTree formattedCode.
		methodClass
			compile: newSourceCode
			classified: compiledMethod protocol.
		Transcript show: newSourceCode.
		textSegmentMorph delete]
]

{ #category : #defaults }
InactiveHaltOnceIconStyler_ReactivateByRewriting >> shouldStyleNode: aNode [

	^ self shouldStyleNode: aNode forSelector: #inactiveHaltOnce
	
]

{ #category : #defaults }
InactiveHaltOnceIconStyler_ReactivateByRewriting >> shouldStyleNode: aNode forSelector: aSelector [
	^aNode isMessage and: [ (aNode selector = aSelector) and: [aNode hasInactiveHalt not]]
]
