"
For each halt message in code browsers (like `self halt`), I add a button in the gutter to deactivate it by using a metalink.
"
Class {
	#name : #'HaltIconStyler_DeactivateByMetalink',
	#superclass : #DeactivateByMetalinkStyler,
	#category : #'HaltManager-Stylers'
}

{ #category : #defaults }
HaltIconStyler_DeactivateByMetalink >> shouldStyleNode: aNode [
	^aNode isMessage and: [ (aNode selector = 'halt') and: [aNode hasInactiveHalt not]]
]
