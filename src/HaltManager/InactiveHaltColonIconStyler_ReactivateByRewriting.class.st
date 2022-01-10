Class {
	#name : #'InactiveHaltColonIconStyler_ReactivateByRewriting',
	#superclass : #ReactivateByRewritingStyler,
	#category : #'HaltManager-Stylers'
}

{ #category : #defaults }
InactiveHaltColonIconStyler_ReactivateByRewriting >> iconBlock: aNode [
	^[ :textSegmentMorph | 
		HaltRewriter rewriteMessageNode: aNode toChangeSelectorTo: #halt:.
		textSegmentMorph delete]
]

{ #category : #defaults }
InactiveHaltColonIconStyler_ReactivateByRewriting >> shouldStyleNode: aNode [
	^aNode isMessage and: [ (aNode selector = 'inactiveHalt:') and: [aNode hasInactiveHalt not]]
]
