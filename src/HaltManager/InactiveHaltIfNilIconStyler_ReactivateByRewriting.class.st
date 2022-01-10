Class {
	#name : #'InactiveHaltIfNilIconStyler_ReactivateByRewriting',
	#superclass : #ReactivateByRewritingStyler,
	#category : #'HaltManager-Stylers'
}

{ #category : #defaults }
InactiveHaltIfNilIconStyler_ReactivateByRewriting >> highlightColor [
	^((Color r: 0.2 g: 0.6 b: 1 alpha: 0.3))
]

{ #category : #defaults }
InactiveHaltIfNilIconStyler_ReactivateByRewriting >> iconBlock: aNode [
	^[ :textSegmentMorph | 
		HaltRewriter rewriteMessageNode: aNode toChangeSelectorTo: #haltIfNil.
		textSegmentMorph delete]
]

{ #category : #defaults }
InactiveHaltIfNilIconStyler_ReactivateByRewriting >> iconFor: aNode [
	^ self iconNamed: #haltIcon 
]

{ #category : #defaults }
InactiveHaltIfNilIconStyler_ReactivateByRewriting >> iconLabelBlock: aNode [
	^ ['Reactivate by rewriting']
]

{ #category : #defaults }
InactiveHaltIfNilIconStyler_ReactivateByRewriting >> shouldStyleNode: aNode [
	^aNode isMessage and: [ (aNode selector = 'inactiveHaltIfNil') and: [aNode hasInactiveHalt not]]
]
