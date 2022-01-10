"
For each haltIf: message in code browsers (like `self haltIf:`) that has been deactivated by attaching a metalink to it, I add a button in the gutter to reactivate it.
"
Class {
	#name : #'InactiveHaltIfIconStyler_ReactivateByMetalink',
	#superclass : #ReactivateByMetalinkStyler,
	#category : #'HaltManager-Stylers'
}

{ #category : #asserting }
InactiveHaltIfIconStyler_ReactivateByMetalink >> shouldStyleNode: aNode [
	
	^ self shouldStyleNode: aNode forSelector: #haltIf:

]
