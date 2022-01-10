Class {
	#name : #'InactiveHaltColonIconStyler_ReactivateByMetalink',
	#superclass : #ReactivateByMetalinkStyler,
	#category : #'HaltManager-Stylers'
}

{ #category : #asserting }
InactiveHaltColonIconStyler_ReactivateByMetalink >> shouldStyleNode: aNode [
	
	^ self shouldStyleNode: aNode forSelector: #halt:

]
