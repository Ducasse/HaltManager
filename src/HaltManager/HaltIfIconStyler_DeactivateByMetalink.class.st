"
For each haltIf: message in code browsers (like `self haltIf: [true]`), I add a button in the gutter to deactivate it by using a metalink.
"
Class {
	#name : #'HaltIfIconStyler_DeactivateByMetalink',
	#superclass : #DeactivateByMetalinkStyler,
	#category : #'HaltManager-Stylers'
}

{ #category : #defaults }
HaltIfIconStyler_DeactivateByMetalink >> highlightColor [
	"Almost completely transparent, but not completely to avoid this bug: https://pharo.fogbugz.com/f/cases/20809/"
	^(Color red alpha: 0.01)
]

{ #category : #defaults }
HaltIfIconStyler_DeactivateByMetalink >> iconBlock: aNode [
	^[ :textSegmentMorph | 
		InactiveHalt_Metalink deactivateHaltNode: aNode.
		textSegmentMorph delete]
]

{ #category : #defaults }
HaltIfIconStyler_DeactivateByMetalink >> iconFor: aNode [
	^ self iconNamed: #haltIcon 
]

{ #category : #defaults }
HaltIfIconStyler_DeactivateByMetalink >> iconLabelBlock: aNode [
	^ ['Deactivate']
]

{ #category : #defaults }
HaltIfIconStyler_DeactivateByMetalink >> shouldStyleNode: aNode [
	^aNode isMessage and: [ (aNode selector = 'haltIf:') and: [aNode hasInactiveHalt not]]
]
