"
For each inactive breakpoint (all flavours of them, so including inactive break once and inactive break on condition) in a code browser , I add a button in the gutter to reactivate it.
"
Class {
	#name : #'InactiveBreakpointIconStyler_Reactivate',
	#superclass : #IconStyler,
	#category : 'HaltManager'
}

{ #category : #defaults }
InactiveBreakpointIconStyler_Reactivate >> highlightColor [
	^((Color r: 0.2 g: 0.6 b: 1 alpha: 0.3))
]

{ #category : #defaults }
InactiveBreakpointIconStyler_Reactivate >> iconBlock: aNode [
	^[ :seg | 
		InactiveBreakpoint reactivateBreakpointFromNode: aNode.
		seg delete]
]

{ #category : #defaults }
InactiveBreakpointIconStyler_Reactivate >> iconFor: aNode [
	^ self iconNamed: #haltIcon 
]

{ #category : #defaults }
InactiveBreakpointIconStyler_Reactivate >> iconLabel: aNode [
	^ 'Reactivate Breakpoint'
]

{ #category : #defaults }
InactiveBreakpointIconStyler_Reactivate >> shouldStyleNode: aNode [
"	|cond|
	cond := aNode hasInactiveBreakpoint.
	Transcript show: cond.
	^ cond."
	
	^aNode hasInactiveBreakpoint
]
