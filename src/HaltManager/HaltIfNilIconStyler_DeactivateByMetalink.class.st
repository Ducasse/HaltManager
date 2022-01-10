"
For each haltIfNil message in code browsers (like `self haltIfNil`), I add a button in the gutter to deactivate it by using a metalink.
"
Class {
	#name : #'HaltIfNilIconStyler_DeactivateByMetalink',
	#superclass : #DeactivateByMetalinkStyler,
	#category : #'HaltManager-Stylers'
}

{ #category : #defaults }
HaltIfNilIconStyler_DeactivateByMetalink >> shouldStyleNode: aNode [
	^aNode isMessage and: [ (aNode selector = 'haltIfNil') and: [aNode hasInactiveHalt not]]
]
