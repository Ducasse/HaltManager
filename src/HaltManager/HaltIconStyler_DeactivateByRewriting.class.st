"
For each halt message in code browsers (like `self halt`), I add a button in the gutter to deactivate it by rewriting it to another type of message.
"
Class {
	#name : #'HaltIconStyler_DeactivateByRewriting',
	#superclass : #DeactivateByRewritingStyler,
	#category : #'HaltManager-Stylers'
}

{ #category : #defaults }
HaltIconStyler_DeactivateByRewriting >> iconBlock: aNode [
	^[ :textSegmentMorph | 
		HaltRewriter rewriteMessageNode: aNode toChangeSelectorTo: #inactiveHalt.
		textSegmentMorph delete]
]

{ #category : #defaults }
HaltIconStyler_DeactivateByRewriting >> iconLabelBlock: aNode [
	^ ['Deactivate by rewriting']
]

{ #category : #defaults }
HaltIconStyler_DeactivateByRewriting >> shouldStyleNode: aNode [
	^aNode isMessage and: [ (aNode selector = 'halt') and: [aNode hasInactiveHalt not]]
]
