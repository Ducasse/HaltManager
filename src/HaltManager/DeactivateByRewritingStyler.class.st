Class {
	#name : #DeactivateByRewritingStyler,
	#superclass : #IconStyler,
	#category : #'HaltManager-Stylers'
}

{ #category : #defaults }
DeactivateByRewritingStyler >> highlightColor [
	"Almost completely transparent, but not completely to avoid this bug: https://pharo.fogbugz.com/f/cases/20809/"
	^(Color red alpha: 0.01)
]

{ #category : #defaults }
DeactivateByRewritingStyler >> iconBlock: aNode [
	^[ :textSegmentMorph | 
		HaltRewriter rewriteMessageNode: aNode toChangeSelectorTo: #inactiveHaltIf:.
		textSegmentMorph delete]
]

{ #category : #defaults }
DeactivateByRewritingStyler >> iconFor: aNode [
	^ self iconNamed: #haltIcon 
]
