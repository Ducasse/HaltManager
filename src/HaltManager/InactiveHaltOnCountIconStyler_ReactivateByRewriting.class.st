Class {
	#name : #'InactiveHaltOnCountIconStyler_ReactivateByRewriting',
	#superclass : #ReactivateByRewritingStyler,
	#category : #'HaltManager-Stylers'
}

{ #category : #defaults }
InactiveHaltOnCountIconStyler_ReactivateByRewriting >> iconBlock: aNode [
	^ self iconBlock: aNode forSelector: #haltOnCount:

]

{ #category : #defaults }
InactiveHaltOnCountIconStyler_ReactivateByRewriting >> shouldStyleNode: aNode [
	
	^ self shouldStyleNode: aNode forSelector: #inactiveHaltOnCount:
	
]
