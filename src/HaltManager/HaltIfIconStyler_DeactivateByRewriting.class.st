"
For each haltIf: message in code browsers (like `self haltIf: [true]`), I add a button in the gutter to deactivate it by rewriting it to another type of message.
"
Class {
	#name : #'HaltIfIconStyler_DeactivateByRewriting',
	#superclass : #DeactivateByRewritingStyler,
	#category : #'HaltManager-Stylers'
}

{ #category : #defaults }
HaltIfIconStyler_DeactivateByRewriting >> shouldStyleNode: aNode [
	^aNode isMessage and: [ (aNode selector = 'haltIf:') and: [aNode hasInactiveHalt not]]
]
