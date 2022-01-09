"
For each haltOnCount: message in code browsers (like `self haltOnCount: 2`), I add a button in the gutter to deactivate it by using a metalink.
"
Class {
	#name : #'HaltOnCountIconStyler_DeactivateByMetalink',
	#superclass : #IconStyler,
	#category : 'HaltManager'
}

{ #category : #defaults }
HaltOnCountIconStyler_DeactivateByMetalink >> highlightColor [
	"Almost completely transparent, but not completely to avoid this bug: https://pharo.fogbugz.com/f/cases/20809/"
	^(Color red alpha: 0.01)
]

{ #category : #defaults }
HaltOnCountIconStyler_DeactivateByMetalink >> iconBlock: aNode [
	^[ :textSegmentMorph | 
		InactiveHalt_Metalink deactivateHaltNode: aNode.
		textSegmentMorph delete]
]

{ #category : #defaults }
HaltOnCountIconStyler_DeactivateByMetalink >> iconFor: aNode [
	^ self iconNamed: #haltIcon 
]

{ #category : #defaults }
HaltOnCountIconStyler_DeactivateByMetalink >> iconLabelBlock: aNode [
	^ ['Deactivate']
]

{ #category : #defaults }
HaltOnCountIconStyler_DeactivateByMetalink >> shouldStyleNode: aNode [
	^aNode isMessage and: [ (aNode selector = 'haltOnCount:') and: [aNode hasInactiveHalt not]]
]
