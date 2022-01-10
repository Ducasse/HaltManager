"
For each halt message in code browsers (like `self halt`) that has been deactivated by attaching a metalink to it, I add a button in the gutter to reactivate it.
"
Class {
	#name : #'InactiveHaltIconStyler_ReactivateByMetalink',
	#superclass : #ReactivateByMetalinkStyler,
	#category : #'HaltManager-Stylers'
}

{ #category : #asserting }
InactiveHaltIconStyler_ReactivateByMetalink >> shouldStyleNode: aNode [
	
	^ self shouldStyleNode: aNode forSelector: #halt

]
