"
For each haltOnce message in code browsers (like `self haltOnce`), I add a button in the gutter to deactivate it by rewriting it to another type of message.
"
Class {
	#name : #'HaltOnceIconStyler_DeactivateByRewriting',
	#superclass : #DeactivateByRewritingStyler,
	#category : #'HaltManager-Stylers'
}

{ #category : #defaults }
HaltOnceIconStyler_DeactivateByRewriting >> iconBlock: aNode [
	^[ :textSegmentMorph | 
		HaltRewriter rewriteMessageNode: aNode toChangeSelectorTo: #inactiveHaltOnce.
		textSegmentMorph delete]
]

{ #category : #defaults }
HaltOnceIconStyler_DeactivateByRewriting >> shouldStyleNode: aNode [
	^aNode isMessage and: [ (aNode selector = 'haltOnce') and: [aNode hasInactiveHalt not]]
]
