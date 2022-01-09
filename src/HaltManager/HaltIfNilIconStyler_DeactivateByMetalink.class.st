"
For each haltIfNil message in code browsers (like `self haltIfNil`), I add a button in the gutter to deactivate it by using a metalink.
"
Class {
	#name : #'HaltIfNilIconStyler_DeactivateByMetalink',
	#superclass : #IconStyler,
	#category : 'HaltManager'
}

{ #category : #defaults }
HaltIfNilIconStyler_DeactivateByMetalink >> highlightColor [
	"Almost completely transparent, but not completely to avoid this bug: https://pharo.fogbugz.com/f/cases/20809/"
	^(Color red alpha: 0.01)
]

{ #category : #defaults }
HaltIfNilIconStyler_DeactivateByMetalink >> iconBlock: aNode [
	^[ :textSegmentMorph | 
		InactiveHalt_Metalink deactivateHaltNode: aNode.
		textSegmentMorph delete]
]

{ #category : #defaults }
HaltIfNilIconStyler_DeactivateByMetalink >> iconFor: aNode [
	^ self iconNamed: #haltIcon 
]

{ #category : #defaults }
HaltIfNilIconStyler_DeactivateByMetalink >> iconLabelBlock: aNode [
	^ ['Deactivate']
]

{ #category : #defaults }
HaltIfNilIconStyler_DeactivateByMetalink >> shouldStyleNode: aNode [
	^aNode isMessage and: [ (aNode selector = 'haltIfNil') and: [aNode hasInactiveHalt not]]
]
