Class {
	#name : #'InactiveHaltIfIconStyler_ReactivateByRewriting',
	#superclass : #ReactivateByRewritingStyler,
	#category : #'HaltManager-Stylers'
}

{ #category : #defaults }
InactiveHaltIfIconStyler_ReactivateByRewriting >> iconBlock: aNode [
	^ self iconBlock: aNode forSelector: #haltIf:

]

{ #category : #defaults }
InactiveHaltIfIconStyler_ReactivateByRewriting >> shouldStyleNode: aNode [

	^ self shouldStyleNode: aNode forSelector: #inactiveHaltIf:
	

]
