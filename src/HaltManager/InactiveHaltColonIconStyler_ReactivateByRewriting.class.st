Class {
	#name : #'InactiveHaltColonIconStyler_ReactivateByRewriting',
	#superclass : #ReactivateByRewritingStyler,
	#category : #'HaltManager-Stylers'
}

{ #category : #defaults }
InactiveHaltColonIconStyler_ReactivateByRewriting >> iconBlock: aNode [
	^ self iconBlock: aNode forSelector: #halt:

]

{ #category : #defaults }
InactiveHaltColonIconStyler_ReactivateByRewriting >> shouldStyleNode: aNode [
	^ self shouldStyleNode: aNode forSelector: #inactiveHalt:
	
]
