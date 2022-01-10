Class {
	#name : #'InactiveHaltColonIconStyler_ReactivateByMetalink',
	#superclass : #ReactivateByMetalinkStyler,
	#category : #'HaltManager-Stylers'
}

{ #category : #defaults }
InactiveHaltColonIconStyler_ReactivateByMetalink >> iconBlock: aNode [
	^[ :seg | 
		InactiveHalt_Metalink reactivateHaltNode: aNode.
		seg delete]
]

{ #category : #defaults }
InactiveHaltColonIconStyler_ReactivateByMetalink >> iconFor: aNode [
	^ self iconNamed: #haltIcon 
]

{ #category : #defaults }
InactiveHaltColonIconStyler_ReactivateByMetalink >> iconLabelBlock: aNode [
	^ ['Reactivate']
]

{ #category : #asserting }
InactiveHaltColonIconStyler_ReactivateByMetalink >> shouldStyleNode: aNode [
	^aNode isMessage and: [ (aNode selector = 'halt:') and: [aNode hasInactiveHalt]].
]
