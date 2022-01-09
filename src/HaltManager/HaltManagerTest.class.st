"
A test case for the HaltManager package
"
Class {
	#name : #HaltManagerTest,
	#superclass : #TestCase,
	#instVars : [
		'breakpointsAddedDuringSetupAndTests',
		'inactiveBreakpointsAddedDuringSetupAndTests'
	],
	#category : 'HaltManager'
}

{ #category : #utility }
HaltManagerTest >> addBreakpointConditionalOnSetupHere [
"Dummy method to indicate a position to put a conditional breakpoint at in the setUp of this test class"
]

{ #category : #utility }
HaltManagerTest >> addBreakpointOnSetupHere [
"Dummy method to indicate a position to put a breakpoint at in the setUp of this test class"
]

{ #category : #utility }
HaltManagerTest >> addBreakpointOnceOnSetupHere [
"Dummy method to indicate a position to put a once breakpoint at in the setUp of this test class"
]

{ #category : #utility }
HaltManagerTest >> addInactiveBreakpointOnSetupHere [
"Dummy method to indicate a position to put an InactiveBreakpoint at in the setUp of this test class"
]

{ #category : #'experiment subjects' }
HaltManagerTest >> expSubForTestDeactivateBreakpoint [
	1+1.
	self addBreakpointOnSetupHere
]

{ #category : #'experiment subjects' }
HaltManagerTest >> expSubForTestDeactivateSelfHaltByRewriting [
	1 + 1.
	self halt
]

{ #category : #'experiment subjects' }
HaltManagerTest >> expSubForTestReactivateBreakpoint [
	1+1.
	self addInactiveBreakpointOnSetupHere
]

{ #category : #'visual test' }
HaltManagerTest >> haltAndBreakpointTest [
	self halt.
	1halt.
	self haltOnce.
	self haltOnCount: 4.
	self haltIf: [ true].
	self inactiveHalt.
	self inactiveHaltOnce.
	self inactiveHaltOnCount: 4.
	self inactiveHaltIf: [ true ].
	'breakpoint'. "Place it using suggestions"
	'breakOnce'. "Place it using suggestions"
	'breakOnCondition'. "Place it using suggestions"
	'inactiveBreakpoint' "Place it using suggestions"
]

{ #category : #'halts and breakpoints' }
HaltManagerTest >> methodWithBreakpoint [
	self addBreakpointOnSetupHere "Breakpoint will be added during setup and removed during teardown"
]

{ #category : #'halts and breakpoints' }
HaltManagerTest >> methodWithBreakpointConditional [
	self addBreakpointConditionalOnSetupHere "Breakpoint will be added during setup and removed during teardown"
]

{ #category : #'halts and breakpoints' }
HaltManagerTest >> methodWithBreakpointInactive [
	self addInactiveBreakpointOnSetupHere "Breakpoint will be added during setup and removed during teardown"
]

{ #category : #'halts and breakpoints' }
HaltManagerTest >> methodWithBreakpointOnce [
	self addBreakpointOnceOnSetupHere "Breakpoint will be added during setup and removed during teardown"
]

{ #category : #'halts and breakpoints' }
HaltManagerTest >> methodWithHalt [
	self halt
]

{ #category : #'halts and breakpoints' }
HaltManagerTest >> methodWithHaltColon [
	self halt: 'Hey'
]

{ #category : #'halts and breakpoints' }
HaltManagerTest >> methodWithHaltIf [
	self haltIf: [ true ]
]

{ #category : #'halts and breakpoints' }
HaltManagerTest >> methodWithHaltIfNil [
	self haltIfNil
]

{ #category : #'halts and breakpoints' }
HaltManagerTest >> methodWithHaltOnCount [
	self haltOnCount: 4
]

{ #category : #'halts and breakpoints' }
HaltManagerTest >> methodWithHaltOnce [
	self haltOnce
]

{ #category : #'halts and breakpoints' }
HaltManagerTest >> methodWithHaltSentToOne [
	1halt
]

{ #category : #'halts and breakpoints' }
HaltManagerTest >> methodWithInactiveHalt [
	self inactiveHalt
]

{ #category : #'halts and breakpoints' }
HaltManagerTest >> methodWithInactiveHaltColon [
	self inactiveHalt: 'hey'
]

{ #category : #'halts and breakpoints' }
HaltManagerTest >> methodWithInactiveHaltIf [
	self inactiveHaltIf: [ true]
]

{ #category : #'halts and breakpoints' }
HaltManagerTest >> methodWithInactiveHaltIfNil [
	self inactiveHaltIfNil
]

{ #category : #'halts and breakpoints' }
HaltManagerTest >> methodWithInactiveHaltOnCount [
	self inactiveHaltOnCount: 4
]

{ #category : #'halts and breakpoints' }
HaltManagerTest >> methodWithInactiveHaltOnce [
	self inactiveHaltOnce
]

{ #category : #'experiment subjects' }
HaltManagerTest >> originalSourceCodeOf_expSubForTestDeactivateSelfHaltByRewriting [
^'expSubForTestDeactivateSelfHaltByRewriting
	1+1.
	self halt.'
]

{ #category : #running }
HaltManagerTest >> setUp [
	breakpointsAddedDuringSetupAndTests := LinkedList new.
	inactiveBreakpointsAddedDuringSetupAndTests := LinkedList new.
	"Adding breakpoints to the message node of selector addBreakpointOnSetupHere in method expSubForTestDeactivateBreakpoint"
	(MessageNodeFinder findMessageNodesSatisfying: [ :msgNode | msgNode selector == #addBreakpointOnSetupHere ] inNode: (self class >>#expSubForTestDeactivateBreakpoint) ast) do: [
		 :node |
		|brkpt| 
		brkpt := Breakpoint new node: node; always; install.
		breakpointsAddedDuringSetupAndTests add: brkpt.
	].
"Adding InactiveBreakpoints to the message node of selector addInactiveBreakpointOnSetupHere in method expSubForTestReactivateBreakpoint"
	(MessageNodeFinder findMessageNodesSatisfying: [ :msgNode | msgNode selector == #addInactiveBreakpointOnSetupHere ] inNode: (self class >>#expSubForTestReactivateBreakpoint) ast) do: [
		 :node |
		|brkpt inactiveBrkpt| 
		brkpt := Breakpoint new node: node; always; install.
		breakpointsAddedDuringSetupAndTests add: brkpt.
		inactiveBrkpt := InactiveBreakpoint deactivateBreakpointFromNode: node.
		inactiveBreakpointsAddedDuringSetupAndTests add: inactiveBrkpt.
	].

	"The following was used for tests about halt rewriting, but was breaking the critics plugin of calypso"
	"self class 
		compile: self originalSourceCodeOf_expSubForTestDeactivateSelfHaltByRewriting
		classified: 'experiment subjects'."
		
	"Adding breakpoints to the message node of selector addBreakpointOnSetupHere in method methodWithBreakpoint"
	(MessageNodeFinder findMessageNodesSatisfying: [ :msgNode | msgNode selector == #addBreakpointOnSetupHere ] inNode: (self class >>#methodWithBreakpoint) ast) do: [
		 :node |
		|brkpt| 
		brkpt := Breakpoint new node: node; always; install.
		breakpointsAddedDuringSetupAndTests add: brkpt.
	].

	"Adding once breakpoints to the message node of selector addBreakpointOnceOnSetupHere in method methodWithBreakpointOnce"
	(MessageNodeFinder findMessageNodesSatisfying: [ :msgNode | msgNode selector == #addBreakpointOnceOnSetupHere ] inNode: (self class >>#methodWithBreakpointOnce) ast) do: [
		 :node |
		|brkpt| 
		brkpt := Breakpoint new node: node; once; install.
		breakpointsAddedDuringSetupAndTests add: brkpt.
	].

	"Adding conditional breakpoints to the message node of selector addBreakpointConditionalOnSetupHere in method methodWithBreakpointConditional"
	(MessageNodeFinder findMessageNodesSatisfying: [ :msgNode | msgNode selector == #addBreakpointConditionalOnSetupHere ] inNode: (self class >>#methodWithBreakpointConditional) ast) do: [
		 :node |
		|brkpt| 
		brkpt := Breakpoint new node: node; condition: (Smalltalk compiler evaluate: 'true'); install.
		breakpointsAddedDuringSetupAndTests add: brkpt.
	].

"Adding InactiveBreakpoints to the message node of selector addInactiveBreakpointOnSetupHere in method methodWithBreakpointInactive"
	(MessageNodeFinder findMessageNodesSatisfying: [ :msgNode | msgNode selector == #addInactiveBreakpointOnSetupHere ] inNode: (self class >>#methodWithBreakpointInactive) ast) do: [
		 :node |
		|brkpt inactiveBrkpt| 
		brkpt := Breakpoint new node: node; always; install.
		breakpointsAddedDuringSetupAndTests add: brkpt.
		inactiveBrkpt := InactiveBreakpoint deactivateBreakpointFromNode: node.
		inactiveBreakpointsAddedDuringSetupAndTests add: inactiveBrkpt.
	].

	
]

{ #category : #running }
HaltManagerTest >> tearDown [
	breakpointsAddedDuringSetupAndTests do: [ :brkpt | ((Breakpoint classVarNamed: 'AllBreakpoints') anySatisfy: [ :brkpt2 | brkpt == brkpt2 ]) ifTrue: [brkpt remove] ].
	inactiveBreakpointsAddedDuringSetupAndTests do: [ :inactivebrkpt | (InactiveBreakpoint allInactiveBreakpoints anySatisfy: [:inacBrkpt| inacBrkpt == inactivebrkpt]) ifTrue: [inactivebrkpt remove] ].
]

{ #category : #tests }
HaltManagerTest >> testDeactivateBreakpoint [
	| nodesWithBreakpoints nodeWithBreakpoint inactiveBreakpoint |
	"Assert that the method does indeed raises a self halt (because of a breakpoint) before touching it"
	self should: [ self expSubForTestDeactivateBreakpoint ] raise: Halt.
	nodesWithBreakpoints := MessageNodeFinder findMessageNodesSatisfying: [ :msgNode | msgNode selector == #addBreakpointOnSetupHere ] inNode: (self class >>#expSubForTestDeactivateBreakpoint) ast.
	"Assert there's only one `self addBreakpointOnSetupHere` in method expSubForTestDeactivateBreakpoint"
	self assert: nodesWithBreakpoints size equals: 1.
	nodeWithBreakpoint := nodesWithBreakpoints first.
	
	inactiveBreakpoint := InactiveBreakpoint deactivateBreakpointFromNode: nodeWithBreakpoint.
	inactiveBreakpointsAddedDuringSetupAndTests add: inactiveBreakpoint.
	"Assert the InactiveBreakpoint just created is indeed in the list of all InactiveBreakpoints maintained by the class"
	self assert: (InactiveBreakpoint allInactiveBreakpoints anySatisfy: [:inacBrkpt | inacBrkpt == inactiveBreakpoint]).
	"Assert that the method does not raise a Halt any longer after its breakpoint has been deactivated"
	self shouldnt: [self expSubForTestDeactivateBreakpoint] raise: Halt.
	
	
	
]

{ #category : #tests }
HaltManagerTest >> testDeactivateSelfHaltByRewriting [
	"This test is commented because compiling code in a test breaks the critics plugin of calypso"
	"Assert that the method does indeed raises a self halt (because of a breakpoint) before touching it"
	"| haltNodes haltNode |
	self should: [ self expSubForTestDeactivateSelfHaltByRewriting ] raise: Halt.
	haltNodes := MessageNodeFinder findMessageNodesSatisfying: [ :msgNode | msgNode selector == #halt ] inNode: (self class >>#expSubForTestDeactivateSelfHaltByRewriting) ast."
	"Assert there's only one `self halt` in method expSubForTestDeactivateSelfHaltByRewriting"
	"self assert: haltNodes size equals: 1.
	haltNode := haltNodes first."
	
	"Deactivate the halt by rewriting the code. Check that this does not raise compilation error"
	"self shouldnt: [ HaltRewriter rewriteMessageNode: haltNode toChangeSelectorTo: #inactiveHalt." "Code from HaltIconStyler_DeactivateByRewriting that is executed when the icon to deactivate the halt is clicked""] raise: SyntaxErrorNotification."
	
	"Assert that the method does not raise a Halt any longer after its halt has been deactivated"
	"self shouldnt: [self expSubForTestDeactivateSelfHaltByRewriting] raise: Halt."
	
	
	
]

{ #category : #tests }
HaltManagerTest >> testMethodsToDisplay [
	| methodsToDisplay methodContainmentAssertionBlock |
	methodsToDisplay := HaltManager methodsToDisplay collect: [:anRGMethodDefinition| anRGMethodDefinition method].
	methodContainmentAssertionBlock := [ :selector | 	self assert: (methodsToDisplay contains: [:aCompiledMethod | aCompiledMethod == (self class >>selector)]) ].

	methodContainmentAssertionBlock value: #methodWithBreakpoint.
	methodContainmentAssertionBlock value: #methodWithBreakpointConditional.
	methodContainmentAssertionBlock value: #methodWithBreakpointOnce.
	methodContainmentAssertionBlock value: #methodWithBreakpointInactive.
	methodContainmentAssertionBlock value: #methodWithHalt.
	methodContainmentAssertionBlock value: #methodWithHaltColon.
	methodContainmentAssertionBlock value: #methodWithHaltIf.
	methodContainmentAssertionBlock value: #methodWithHaltIfNil.
	methodContainmentAssertionBlock value: #methodWithHaltOnCount.
	methodContainmentAssertionBlock value: #methodWithHaltOnce.
	methodContainmentAssertionBlock value: #methodWithHaltSentToOne.
	methodContainmentAssertionBlock value: #methodWithInactiveHalt.
	methodContainmentAssertionBlock value: #methodWithInactiveHaltColon.
	methodContainmentAssertionBlock value: #methodWithInactiveHaltIf.
	methodContainmentAssertionBlock value: #methodWithInactiveHaltIfNil.
	methodContainmentAssertionBlock value: #methodWithInactiveHaltOnCount.
	methodContainmentAssertionBlock value: #methodWithInactiveHaltOnce.
]

{ #category : #tests }
HaltManagerTest >> testReactivateBreakpoint [
	| nodesWithInactiveBreakpoints nodeWithInactiveBreakpoint |
	"Assert that the method does not raises a self halt before touching it"
	self shouldnt: [ self expSubForTestReactivateBreakpoint ] raise: Halt.
	nodesWithInactiveBreakpoints := MessageNodeFinder findMessageNodesSatisfying: [ :msgNode | msgNode selector == #addInactiveBreakpointOnSetupHere ] inNode: (self class >>#expSubForTestReactivateBreakpoint) ast.
	"Assert there's only one `self addInactiveBreakpointOnSetupHere` in method expSubForTestReactivateBreakpoint"
	self assert: nodesWithInactiveBreakpoints size equals: 1.
	nodeWithInactiveBreakpoint := nodesWithInactiveBreakpoints first.
	
	InactiveBreakpoint reactivateBreakpointFromNode: nodeWithInactiveBreakpoint.
	"Assert that the method now raises a Halt after its breakpoint has been reactivated"
	self should: [self expSubForTestReactivateBreakpoint] raise: Halt.
	
	
	
]
