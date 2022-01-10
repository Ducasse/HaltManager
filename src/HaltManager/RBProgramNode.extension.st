Extension { #name : #RBProgramNode }

{ #category : #'*HaltManager' }
RBProgramNode >> hasInactiveBreakpoint [
	self hasMetalinkBefore ifFalse: [ ^false ].
	^ self beforeLinks anySatisfy: [ :link | link metaObject = InactiveBreakpointMetalinkTargetException ].
]

{ #category : #'*HaltManager' }
RBProgramNode >> hasInactiveHalt [
	self hasMetalinkInstead ifFalse: [ ^false ].
	^ self insteadLinks anySatisfy: [ :link | link metaObject = InactiveHaltMetalinkTargetException  ].
]
