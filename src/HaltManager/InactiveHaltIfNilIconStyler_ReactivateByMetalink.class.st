Class {
	#name : #'InactiveHaltIfNilIconStyler_ReactivateByMetalink',
	#superclass : #ReactivateByMetalinkStyler,
	#category : #'HaltManager-Stylers'
}

{ #category : #defaults }
InactiveHaltIfNilIconStyler_ReactivateByMetalink >> iconBlock: aNode [
	^[ :seg | 
		InactiveHalt_Metalink reactivateHaltNode: aNode.
		seg delete]
]

{ #category : #defaults }
InactiveHaltIfNilIconStyler_ReactivateByMetalink >> iconLabelBlock: aNode [
	^ ['Reactivate']
]

{ #category : #asserting }
InactiveHaltIfNilIconStyler_ReactivateByMetalink >> shouldStyleNode: aNode [
	^aNode isMessage and: [ (aNode selector = 'haltIfNil') and: [aNode hasInactiveHalt]].
]
