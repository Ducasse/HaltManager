"
For each inactive breakpoint (all flavours of them, so including inactive break once and inactive break on condition) in a code browser , I add a button in the gutter to remove it.
"
Class {
	#name : #'InactiveBreakpointIconStyler_Remove',
	#superclass : #IconStyler,
	#category : 'HaltManager'
}

{ #category : #defaults }
InactiveBreakpointIconStyler_Remove >> highlightColor [
	"This colour is invisible, because the InactiveBreakpointIconStylerReactivation class is normally already highlighting inactive breakpoints"
	^((Color r: 0.2 g: 0.6 b: 1 alpha: 0))
]

{ #category : #defaults }
InactiveBreakpointIconStyler_Remove >> iconBlock: aNode [
	^[ :seg | 
		InactiveBreakpoint removeFrom: aNode.
		seg delete]
]

{ #category : #defaults }
InactiveBreakpointIconStyler_Remove >> iconFor: aNode [
	^ self iconNamed: #haltIcon 
]

{ #category : #defaults }
InactiveBreakpointIconStyler_Remove >> iconLabel: aNode [
	^ 'Remove Inactive Breakpoint'
]

{ #category : #defaults }
InactiveBreakpointIconStyler_Remove >> shouldStyleNode: aNode [
	^aNode hasInactiveBreakpoint
]
