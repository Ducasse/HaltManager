"
For each haltOnce message in code browsers (like `self haltOnce`), I add a button in the gutter to deactivate it by using a metalink.
"
Class {
	#name : #'HaltOnceIconStyler_DeactivateByMetalink',
	#superclass : #DeactivateByMetalinkStyler,
	#category : #'HaltManager-Stylers'
}

{ #category : #defaults }
HaltOnceIconStyler_DeactivateByMetalink >> iconBlock: aNode [
	^[ :textSegmentMorph | 
		InactiveHalt_Metalink deactivateHaltNode: aNode.
		textSegmentMorph delete]
]

{ #category : #defaults }
HaltOnceIconStyler_DeactivateByMetalink >> iconFor: aNode [
	^ self iconNamed: #haltIcon 
]

{ #category : #defaults }
HaltOnceIconStyler_DeactivateByMetalink >> iconLabelBlock: aNode [
	^ ['Deactivate']
]

{ #category : #defaults }
HaltOnceIconStyler_DeactivateByMetalink >> shouldStyleNode: aNode [
	^aNode isMessage and: [ (aNode selector = 'haltOnce') and: [aNode hasInactiveHalt not]]
]
