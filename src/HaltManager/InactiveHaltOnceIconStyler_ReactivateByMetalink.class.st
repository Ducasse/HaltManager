"
For each haltOnCount: message in code browsers (like `self haltOnCount:`) that has been deactivated by attaching a metalink to it, I add a button in the gutter to reactivate it.
"
Class {
	#name : #'InactiveHaltOnceIconStyler_ReactivateByMetalink',
	#superclass : #ReactivateByMetalinkStyler,
	#category : #'HaltManager-Stylers'
}

{ #category : #defaults }
InactiveHaltOnceIconStyler_ReactivateByMetalink >> highlightColor [
	^((Color r: 0.2 g: 0.6 b: 1 alpha: 0.3))
]

{ #category : #defaults }
InactiveHaltOnceIconStyler_ReactivateByMetalink >> iconBlock: aNode [
	^[ :seg | 
		InactiveHalt_Metalink reactivateHaltNode: aNode.
		seg delete]
]

{ #category : #defaults }
InactiveHaltOnceIconStyler_ReactivateByMetalink >> iconFor: aNode [
	^ self iconNamed: #haltIcon 
]

{ #category : #defaults }
InactiveHaltOnceIconStyler_ReactivateByMetalink >> iconLabelBlock: aNode [
	^ ['Reactivate']
]

{ #category : #asserting }
InactiveHaltOnceIconStyler_ReactivateByMetalink >> shouldStyleNode: aNode [
	^aNode isMessage and: [ (aNode selector = 'haltOnce') and: [aNode hasInactiveHalt]].
]
