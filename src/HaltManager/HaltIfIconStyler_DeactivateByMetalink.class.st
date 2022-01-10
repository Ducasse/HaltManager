"
For each haltIf: message in code browsers (like `self haltIf: [true]`), I add a button in the gutter to deactivate it by using a metalink.
"
Class {
	#name : #'HaltIfIconStyler_DeactivateByMetalink',
	#superclass : #DeactivateByMetalinkStyler,
	#category : #'HaltManager-Stylers'
}

{ #category : #defaults }
HaltIfIconStyler_DeactivateByMetalink >> shouldStyleNode: aNode [
	^aNode isMessage and: [ (aNode selector = 'haltIf:') and: [aNode hasInactiveHalt not]]
]
