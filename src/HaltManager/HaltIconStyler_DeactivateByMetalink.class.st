"
For each halt message in code browsers (like `self halt`), I add a button in the gutter to deactivate it by using a metalink.
"
Class {
	#name : #'HaltIconStyler_DeactivateByMetalink',
	#superclass : #DeactivateByMetalinkStyler,
	#category : #'HaltManager-Stylers'
}

{ #category : #defaults }
HaltIconStyler_DeactivateByMetalink >> highlightColor [
	"Almost completely transparent, but not completely to avoid this bug: https://pharo.fogbugz.com/f/cases/20809/"
	^(Color red alpha: 0.01)
]

{ #category : #defaults }
HaltIconStyler_DeactivateByMetalink >> iconBlock: aNode [
	^[ :textSegmentMorph | 
		InactiveHalt_Metalink deactivateHaltNode: aNode.
		textSegmentMorph delete]
]

{ #category : #defaults }
HaltIconStyler_DeactivateByMetalink >> iconFor: aNode [
	^ self iconNamed: #haltIcon 
]

{ #category : #defaults }
HaltIconStyler_DeactivateByMetalink >> iconLabelBlock: aNode [
	^ ['Deactivate']
]

{ #category : #defaults }
HaltIconStyler_DeactivateByMetalink >> shouldStyleNode: aNode [
	^aNode isMessage and: [ (aNode selector = 'halt') and: [aNode hasInactiveHalt not]]
]
