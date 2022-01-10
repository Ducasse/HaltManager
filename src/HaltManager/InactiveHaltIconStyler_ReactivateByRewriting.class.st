Class {
	#name : #'InactiveHaltIconStyler_ReactivateByRewriting',
	#superclass : #ReactivateByRewritingStyler,
	#category : #'HaltManager-Stylers'
}

{ #category : #defaults }
InactiveHaltIconStyler_ReactivateByRewriting >> highlightColor [
	^((Color r: 0.2 g: 0.6 b: 1 alpha: 0.3))
]

{ #category : #defaults }
InactiveHaltIconStyler_ReactivateByRewriting >> iconBlock: aNode [
	^[ :textSegmentMorph | 
		HaltRewriter rewriteMessageNode: aNode toChangeSelectorTo: #halt.
		textSegmentMorph delete]
]

{ #category : #defaults }
InactiveHaltIconStyler_ReactivateByRewriting >> iconFor: aNode [
	^ self iconNamed: #haltIcon 
]

{ #category : #defaults }
InactiveHaltIconStyler_ReactivateByRewriting >> iconLabelBlock: aNode [
	^ ['Reactivate by rewriting']
]

{ #category : #defaults }
InactiveHaltIconStyler_ReactivateByRewriting >> shouldStyleNode: aNode [
	^aNode isMessage and: [ (aNode selector = 'inactiveHalt') and: [aNode hasInactiveHalt not]]
]
