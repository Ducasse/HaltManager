Class {
	#name : #ReactivateByMetalinkStyler,
	#superclass : #IconStyler,
	#category : #'HaltManager-Stylers'
}

{ #category : #defaults }
ReactivateByMetalinkStyler >> highlightColor [
	^((Color r: 0.2 g: 0.6 b: 1 alpha: 0.3))
]

{ #category : #defaults }
ReactivateByMetalinkStyler >> iconBlock: aNode [
	^[ :seg | 
		InactiveHaltMetalink reactivateHaltNode: aNode.
		seg delete]
]

{ #category : #defaults }
ReactivateByMetalinkStyler >> iconFor: aNode [
	^ self iconNamed: #haltIcon 
]

{ #category : #defaults }
ReactivateByMetalinkStyler >> iconLabelBlock: aNode [
	^ ['Reactivate']
]

{ #category : #asserting }
ReactivateByMetalinkStyler >> shouldStyleNode: aNode forSelector: aSelector [
	^aNode isMessage and: [ (aNode selector = aSelector) and: [aNode hasInactiveHalt]]

]
