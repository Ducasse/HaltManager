"
For each haltIfNil message in code browsers (like `self haltIfNil`), I add a button in the gutter to deactivate it by rewriting it to another type of message.
"
Class {
	#name : #'HaltIfNilIconStyler_DeactivateByRewriting',
	#superclass : #IconStyler,
	#category : 'HaltManager'
}

{ #category : #defaults }
HaltIfNilIconStyler_DeactivateByRewriting >> highlightColor [
	"Almost completely transparent, but not completely to avoid this bug: https://pharo.fogbugz.com/f/cases/20809/"
	^(Color red alpha: 0.01)
]

{ #category : #defaults }
HaltIfNilIconStyler_DeactivateByRewriting >> iconBlock: aNode [
	^[ :textSegmentMorph | 
		HaltRewriter rewriteMessageNode: aNode toChangeSelectorTo: #inactiveHaltIfNil.
		textSegmentMorph delete]
]

{ #category : #defaults }
HaltIfNilIconStyler_DeactivateByRewriting >> iconFor: aNode [
	^ self iconNamed: #haltIcon 
]

{ #category : #defaults }
HaltIfNilIconStyler_DeactivateByRewriting >> iconLabelBlock: aNode [
	^ ['Deactivate by rewriting']
]

{ #category : #defaults }
HaltIfNilIconStyler_DeactivateByRewriting >> shouldStyleNode: aNode [
	^aNode isMessage and: [ (aNode selector = 'haltIfNil') and: [aNode hasInactiveHalt not]]
]
