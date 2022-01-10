Class {
	#name : #ReactivateByRewritingStyler,
	#superclass : #IconStyler,
	#category : #'HaltManager-Stylers'
}

{ #category : #defaults }
ReactivateByRewritingStyler >> highlightColor [
	^((Color r: 0.2 g: 0.6 b: 1 alpha: 0.3))
]

{ #category : #defaults }
ReactivateByRewritingStyler >> iconBlock: aNode forSelector: aSelector [
	^[ :textSegmentMorph | 
		HaltRewriter rewriteMessageNode: aNode toChangeSelectorTo: aSelector.
		textSegmentMorph delete]
]

{ #category : #defaults }
ReactivateByRewritingStyler >> iconFor: aNode [
	^ self iconNamed: #haltIcon 
]

{ #category : #defaults }
ReactivateByRewritingStyler >> iconLabelBlock: aNode [
	^ ['Reactivate by rewriting']
]

{ #category : #asserting }
ReactivateByRewritingStyler >> shouldStyleNode: aNode forSelector: aSelector [
	^aNode isMessage and: [ (aNode selector = aSelector) and: [aNode hasInactiveHalt not]]
]
