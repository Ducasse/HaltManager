"
Metalinks attached to halt (and flavours) ast nodes to erase their bytecode halting the execution call the doNotBreak method of my class (which does not do anything) so that they can be distinguished from other metalinks and recognised as what they are.
"
Class {
	#name : #'InactiveHalt_MetalinkTarget',
	#superclass : #Exception,
	#category : 'HaltManager'
}

{ #category : #'as yet unclassified' }
InactiveHalt_MetalinkTarget class >> doNotBreak [
]

{ #category : #accessing }
InactiveHalt_MetalinkTarget >> defaultAction [
	"The default action taken if the exception is signaled."

	"Do nothing. This is not a real break"
]
