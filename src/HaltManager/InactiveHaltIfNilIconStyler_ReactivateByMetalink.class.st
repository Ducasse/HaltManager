Class {
	#name : #'InactiveHaltIfNilIconStyler_ReactivateByMetalink',
	#superclass : #ReactivateByMetalinkStyler,
	#category : #'HaltManager-Stylers'
}

{ #category : #asserting }
InactiveHaltIfNilIconStyler_ReactivateByMetalink >> shouldStyleNode: aNode [
	
	^ self shouldStyleNode: aNode forSelector: #haltIfNil

]
