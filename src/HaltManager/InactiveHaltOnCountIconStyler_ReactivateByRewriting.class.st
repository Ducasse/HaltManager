Class {
	#name : #'InactiveHaltOnCountIconStyler_ReactivateByRewriting',
	#superclass : #ReactivateByRewritingStyler,
	#category : #'HaltManager-Stylers'
}

{ #category : #defaults }
InactiveHaltOnCountIconStyler_ReactivateByRewriting >> iconBlock: aNode [
	^[ :textSegmentMorph | 
		HaltRewriter rewriteMessageNode: aNode toChangeSelectorTo: #haltOnCount:.
		textSegmentMorph delete]
]

{ #category : #defaults }
InactiveHaltOnCountIconStyler_ReactivateByRewriting >> shouldStyleNode: aNode [
	^aNode isMessage and: [ (aNode selector = 'inactiveHaltOnCount:') and: [aNode hasInactiveHalt not]]
]
