"
For each haltOnCount: message in code browsers (like `self haltOnCount:`) that has been deactivated by attaching a metalink to it, I add a button in the gutter to reactivate it.
"
Class {
	#name : #'InactiveHaltOnCountIconStyler_ReactivateByMetalink',
	#superclass : #ReactivateByMetalinkStyler,
	#category : #'HaltManager-Stylers'
}

{ #category : #asserting }
InactiveHaltOnCountIconStyler_ReactivateByMetalink >> shouldStyleNode: aNode [
	
	^ self shouldStyleNode: aNode forSelector: #haltOnCount:

]
