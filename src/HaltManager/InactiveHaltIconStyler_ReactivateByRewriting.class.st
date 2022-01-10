Class {
	#name : #'InactiveHaltIconStyler_ReactivateByRewriting',
	#superclass : #ReactivateByRewritingStyler,
	#category : #'HaltManager-Stylers'
}

{ #category : #defaults }
InactiveHaltIconStyler_ReactivateByRewriting >> iconBlock: aNode [
	^ self iconBlock: aNode forSelector: #halt

]

{ #category : #defaults }
InactiveHaltIconStyler_ReactivateByRewriting >> shouldStyleNode: aNode [
	^ self shouldStyleNode: aNode forSelector: #inactiveHalt
	
	
]
