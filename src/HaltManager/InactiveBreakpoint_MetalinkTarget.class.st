"
Metalinks attached to ast nodes to mark the positions of inactive breakpoints call the doNotBreak method of my class (which does not do anything) so that they can be distinguished from other metalinks and recognised as what they are.
"
Class {
	#name : #'InactiveBreakpoint_MetalinkTarget',
	#superclass : #Exception,
	#category : 'HaltManager'
}

{ #category : #'as yet unclassified' }
InactiveBreakpoint_MetalinkTarget class >> doNotBreak [
]

{ #category : #accessing }
InactiveBreakpoint_MetalinkTarget >> defaultAction [
	"The default action taken if the exception is signaled."

	"Do nothing. This is not a real break"
]
