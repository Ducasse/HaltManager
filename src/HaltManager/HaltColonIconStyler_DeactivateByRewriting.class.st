"
For each halt: message in code browsers (like `self halt: 'hello'`), I add a button in the gutter to deactivate it by rewriting it to another type of message.
"
Class {
	#name : #'HaltColonIconStyler_DeactivateByRewriting',
	#superclass : #IconStyler,
	#category : #'HaltManager-Stylers'
}

{ #category : #defaults }
HaltColonIconStyler_DeactivateByRewriting >> highlightColor [
	"Almost completely transparent, but not completely to avoid this bug: https://pharo.fogbugz.com/f/cases/20809/"
	^(Color red alpha: 0.01)
]

{ #category : #defaults }
HaltColonIconStyler_DeactivateByRewriting >> iconBlock: aNode [
	^[ :textSegmentMorph | 
		HaltRewriter rewriteMessageNode: aNode toChangeSelectorTo: #inactiveHalt:.
		textSegmentMorph delete]
]

{ #category : #defaults }
HaltColonIconStyler_DeactivateByRewriting >> iconFor: aNode [
	^ self iconNamed: #haltIcon 
]

{ #category : #defaults }
HaltColonIconStyler_DeactivateByRewriting >> iconLabelBlock: aNode [
	^ ['Deactivate by rewriting']
]

{ #category : #defaults }
HaltColonIconStyler_DeactivateByRewriting >> shouldStyleNode: aNode [
	^aNode isMessage and: [ (aNode selector = 'halt:') and: [aNode hasInactiveHalt not]]
]
