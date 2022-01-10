Class {
	#name : #'InactiveHaltIfNilIconStyler_ReactivateByRewriting',
	#superclass : #ReactivateByRewritingStyler,
	#category : #'HaltManager-Stylers'
}

{ #category : #defaults }
InactiveHaltIfNilIconStyler_ReactivateByRewriting >> iconBlock: aNode [
	^ self iconBlock: aNode forSelector: #haltIfNil

]

{ #category : #defaults }
InactiveHaltIfNilIconStyler_ReactivateByRewriting >> shouldStyleNode: aNode [

	^ self shouldStyleNode: aNode forSelector: #inactiveHaltIfNil
	
]
