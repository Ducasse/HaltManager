Class {
	#name : #'InactiveHaltOnCountIconStyler_ReactivateByRewriting',
	#superclass : #ReactivateByRewritingStyler,
	#category : #'HaltManager-Stylers'
}

{ #category : #defaults }
InactiveHaltOnCountIconStyler_ReactivateByRewriting >> highlightColor [
	^((Color r: 0.2 g: 0.6 b: 1 alpha: 0.3))
]

{ #category : #defaults }
InactiveHaltOnCountIconStyler_ReactivateByRewriting >> iconBlock: aNode [
	^[ :textSegmentMorph | 
		HaltRewriter rewriteMessageNode: aNode toChangeSelectorTo: #haltOnCount:.
		textSegmentMorph delete]
]

{ #category : #defaults }
InactiveHaltOnCountIconStyler_ReactivateByRewriting >> iconFor: aNode [
	^ self iconNamed: #haltIcon 
]

{ #category : #defaults }
InactiveHaltOnCountIconStyler_ReactivateByRewriting >> iconLabelBlock: aNode [
	^ ['Reactivate by rewriting']
]

{ #category : #defaults }
InactiveHaltOnCountIconStyler_ReactivateByRewriting >> shouldStyleNode: aNode [
	^aNode isMessage and: [ (aNode selector = 'inactiveHaltOnCount:') and: [aNode hasInactiveHalt not]]
]
