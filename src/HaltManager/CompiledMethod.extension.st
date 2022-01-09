Extension { #name : #CompiledMethod }

{ #category : #'*HaltManager' }
CompiledMethod >> hasInactiveBreakpoint [
	^ InactiveBreakpoint isInstalledIn: self
	
]
