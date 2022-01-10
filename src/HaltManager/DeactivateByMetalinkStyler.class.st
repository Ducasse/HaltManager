Class {
	#name : #DeactivateByMetalinkStyler,
	#superclass : #IconStyler,
	#category : #'HaltManager-Stylers'
}

{ #category : #defaults }
DeactivateByMetalinkStyler >> highlightColor [
	"Almost completely transparent, but not completely to avoid this bug: https://pharo.fogbugz.com/f/cases/20809/"
	^(Color red alpha: 0.01)
]

{ #category : #defaults }
DeactivateByMetalinkStyler >> iconBlock: aNode [
	^[ :textSegmentMorph | 
		InactiveHaltMetalink deactivateHaltNode: aNode.
		textSegmentMorph delete]
]

{ #category : #defaults }
DeactivateByMetalinkStyler >> iconFor: aNode [
	^ self iconNamed: #haltIcon 
]

{ #category : #defaults }
DeactivateByMetalinkStyler >> iconLabelBlock: aNode [
	^ ['Deactivate']
]
