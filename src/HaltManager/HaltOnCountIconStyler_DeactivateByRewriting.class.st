"
For each haltOnCount: message in code browsers (like `self haltOnCount: 2`), I add a button in the gutter to deactivate it by rewriting it to another type of message.
"
Class {
	#name : #'HaltOnCountIconStyler_DeactivateByRewriting',
	#superclass : #DeactivateByRewritingStyler,
	#category : #'HaltManager-Stylers'
}

{ #category : #defaults }
HaltOnCountIconStyler_DeactivateByRewriting >> iconBlock: aNode [
	^[ :textSegmentMorph | 
		HaltRewriter rewriteMessageNode: aNode toChangeSelectorTo: #inactiveHaltOnCount:.
		textSegmentMorph delete]
]

{ #category : #defaults }
HaltOnCountIconStyler_DeactivateByRewriting >> iconLabelBlock: aNode [
	^ ['Deactivate by rewriting']
]

{ #category : #defaults }
HaltOnCountIconStyler_DeactivateByRewriting >> shouldStyleNode: aNode [
	^aNode isMessage and: [ (aNode selector = 'haltOnCount:') and: [aNode hasInactiveHalt not]]
]
