"
For each haltOnCount: message in code browsers (like `self haltOnCount: 2`), I add a button in the gutter to deactivate it by using a metalink.
"
Class {
	#name : #'HaltOnCountIconStyler_DeactivateByMetalink',
	#superclass : #DeactivateByMetalinkStyler,
	#category : #'HaltManager-Stylers'
}

{ #category : #defaults }
HaltOnCountIconStyler_DeactivateByMetalink >> shouldStyleNode: aNode [
	^aNode isMessage and: [ (aNode selector = 'haltOnCount:') and: [aNode hasInactiveHalt not]]
]
