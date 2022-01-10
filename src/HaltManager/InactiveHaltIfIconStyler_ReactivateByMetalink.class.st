"
For each haltIf: message in code browsers (like `self haltIf:`) that has been deactivated by attaching a metalink to it, I add a button in the gutter to reactivate it.
"
Class {
	#name : #'InactiveHaltIfIconStyler_ReactivateByMetalink',
	#superclass : #ReactivateByMetalinkStyler,
	#category : #'HaltManager-Stylers'
}

{ #category : #defaults }
InactiveHaltIfIconStyler_ReactivateByMetalink >> highlightColor [
	^((Color r: 0.2 g: 0.6 b: 1 alpha: 0.3))
]

{ #category : #defaults }
InactiveHaltIfIconStyler_ReactivateByMetalink >> iconBlock: aNode [
	^[ :seg | 
		InactiveHalt_Metalink reactivateHaltNode: aNode.
		seg delete]
]

{ #category : #defaults }
InactiveHaltIfIconStyler_ReactivateByMetalink >> iconFor: aNode [
	^ self iconNamed: #haltIcon 
]

{ #category : #defaults }
InactiveHaltIfIconStyler_ReactivateByMetalink >> iconLabelBlock: aNode [
	^ ['Reactivate']
]

{ #category : #asserting }
InactiveHaltIfIconStyler_ReactivateByMetalink >> shouldStyleNode: aNode [
	^aNode isMessage and: [ (aNode selector = 'haltIf:') and: [aNode hasInactiveHalt]].
]
