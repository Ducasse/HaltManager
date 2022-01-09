"
For each breakpoint (all flavours of them, so including break once and break on condition) in a code browser , I add a button in the gutter to deactivate it.
"
Class {
	#name : #ActiveBreakpointIconStyler,
	#superclass : #BreakpointIconStyler,
	#category : #'HaltManager-Stylers'
}

{ #category : #defaults }
ActiveBreakpointIconStyler >> highlightColor [
	"Almost completely transparent, but not completely to avoid this bug: https://pharo.fogbugz.com/f/cases/20809/"
	^ Color red alpha: 0.01
]

{ #category : #defaults }
ActiveBreakpointIconStyler >> iconBlock: aNode [
	^[ :textSegmentMorph | 
		InactiveBreakpoint deactivateBreakpointFromNode: aNode.
		textSegmentMorph delete]
]

{ #category : #defaults }
ActiveBreakpointIconStyler >> iconLabel: aNode [
	^ 'Deactivate Breakpoint'
]
