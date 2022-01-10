"
For each halt: message in code browsers (like `self halt: 'hello'`), I add a button in the gutter to deactivate it by using a metalink.
"
Class {
	#name : #'HaltColonIconStyler_DeactivateByMetalink',
	#superclass : #DeactivateByMetalinkStyler,
	#category : #'HaltManager-Stylers'
}

{ #category : #defaults }
HaltColonIconStyler_DeactivateByMetalink >> highlightColor [
	"Almost completely transparent, but not completely to avoid this bug: https://pharo.fogbugz.com/f/cases/20809/"
	^(Color red alpha: 0.01)
]

{ #category : #defaults }
HaltColonIconStyler_DeactivateByMetalink >> iconBlock: aNode [
	^[ :textSegmentMorph | 
		InactiveHalt_Metalink deactivateHaltNode: aNode.
		textSegmentMorph delete]
]

{ #category : #defaults }
HaltColonIconStyler_DeactivateByMetalink >> iconFor: aNode [
	^ self iconNamed: #haltIcon 
]

{ #category : #defaults }
HaltColonIconStyler_DeactivateByMetalink >> iconLabelBlock: aNode [
	^ ['Deactivate']
]

{ #category : #defaults }
HaltColonIconStyler_DeactivateByMetalink >> shouldStyleNode: aNode [
	^aNode isMessage and: [ (aNode selector = 'halt:') and: [aNode hasInactiveHalt not]]
]
