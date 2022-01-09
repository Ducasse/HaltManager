Class {
	#name : #'InactiveHaltColonIconStyler_ReactivateByRewriting',
	#superclass : #IconStyler,
	#category : #'HaltManager-Stylers'
}

{ #category : #defaults }
InactiveHaltColonIconStyler_ReactivateByRewriting >> highlightColor [
	^((Color r: 0.2 g: 0.6 b: 1 alpha: 0.3))
]

{ #category : #defaults }
InactiveHaltColonIconStyler_ReactivateByRewriting >> iconBlock: aNode [
	^[ :textSegmentMorph | 
		HaltRewriter rewriteMessageNode: aNode toChangeSelectorTo: #halt:.
		textSegmentMorph delete]
]

{ #category : #defaults }
InactiveHaltColonIconStyler_ReactivateByRewriting >> iconFor: aNode [
	^ self iconNamed: #haltIcon 
]

{ #category : #defaults }
InactiveHaltColonIconStyler_ReactivateByRewriting >> iconLabelBlock: aNode [
	^ ['Reactivate by rewriting']
]

{ #category : #defaults }
InactiveHaltColonIconStyler_ReactivateByRewriting >> shouldStyleNode: aNode [
	^aNode isMessage and: [ (aNode selector = 'inactiveHalt:') and: [aNode hasInactiveHalt not]]
]
