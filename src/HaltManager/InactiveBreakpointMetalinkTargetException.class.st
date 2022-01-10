"
Metalinks attached to ast nodes to mark the positions of inactive breakpoints call the doNotBreak method of my class (which does not do anything) so that they can be distinguished from other metalinks and recognised as what they are.
"
Class {
	#name : #InactiveBreakpointMetalinkTargetException,
	#superclass : #Exception,
	#category : #'HaltManager-Core'
}

{ #category : #'as yet unclassified' }
InactiveBreakpointMetalinkTargetException class >> doNotBreak [
]

{ #category : #accessing }
InactiveBreakpointMetalinkTargetException >> defaultAction [
	"The default action taken if the exception is signaled."

	"Do nothing. This is not a real break"
]
