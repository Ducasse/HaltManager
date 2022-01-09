Class {
	#name : #'InactiveHaltIfIconStyler_ReactivateByRewriting',
	#superclass : #IconStyler,
	#category : #'HaltManager-Stylers'
}

{ #category : #defaults }
InactiveHaltIfIconStyler_ReactivateByRewriting >> highlightColor [
	^((Color r: 0.2 g: 0.6 b: 1 alpha: 0.3))
]

{ #category : #defaults }
InactiveHaltIfIconStyler_ReactivateByRewriting >> iconBlock: aNode [
	^[ :textSegmentMorph | 
		HaltRewriter rewriteMessageNode: aNode toChangeSelectorTo: #haltIf:.
		textSegmentMorph delete]
]

{ #category : #defaults }
InactiveHaltIfIconStyler_ReactivateByRewriting >> iconFor: aNode [
	^ self iconNamed: #haltIcon 
]

{ #category : #defaults }
InactiveHaltIfIconStyler_ReactivateByRewriting >> iconLabelBlock: aNode [
	^ ['Reactivate by rewriting']
]

{ #category : #defaults }
InactiveHaltIfIconStyler_ReactivateByRewriting >> shouldStyleNode: aNode [
	^aNode isMessage and: [ (aNode selector = 'inactiveHaltIf:') and: [aNode hasInactiveHalt not]]
]
