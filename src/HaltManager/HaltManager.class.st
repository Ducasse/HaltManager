"
My method openHaltManager opens a method browser with all the methods containing breakpoints (and their different flavours like break once or break on condition), inactive breakpoints (and flavours), halts (and flavours like haltIf: haltOnCount:, haltOnce...) and inactive halts (and flavours like inactiveHaltIf:, inactiveHaltOnCount:...).

I am also responsible for the HaltManager entry in the Tools section of the world menu
"
Class {
	#name : #HaltManager,
	#superclass : #Object,
	#category : 'HaltManager'
}

{ #category : #filtering }
HaltManager class >> blacklist [
	"These methods will not be shown by HaltManager by default. They contain halts but are meant to contain them (for example, they can be testing that executing self halt does indeed raise a halt)
	Format: Array of {class name symbol. method name symbol} arrays"
	^ { 
	{#ClyClassWithHalts. #methodWithHalts2}.
	{#ClyClassWithHalts. #methodWithHalts1}.
	{#ClyClassWithProblemMethods. #methodWithHalt}.
	{#ClyClassWithProblemMethods. #methodWithHalt2}.
	{#GTSUnitExampleFailingTest. #testWithHalt}.
	{#Object. #openDebugger}.
	{#Object. #openDebugger:}.
	{#ObjectTest. #b}.
	{#ObjectTest. #b1}.
	{#ObjectTest. #testHaltIf}.
	{#ObjectTest. #testHaltOnce}.
	{#ObjectTest. #testHaltOnCount}.
	{#UndefinedObjectTest. #testHaltIfNil}.
	{#UndefinedObjectTest. #testIfNil}.
	{#UndefinedObjectTest. #testIfNilIfNotNil}.
	{#UndefinedObjectTest. #testIfNotNilIfNil}.
	{#CodeSimulationTests. #methodWithHalt}.
	{#RBRefactoryTestDataApp. #cruft}.
	{#RBSmalllintTestObject. #codeCruftLeftInMethods}.
	{#RBDummyRefactoryTestDataApp. #cruft}.
	 }
]

{ #category : #filtering }
HaltManager class >> filterOutMethodsFromBlacklist: anOrderedCollectionOfRBMethodDefinition [
	^ anOrderedCollectionOfRBMethodDefinition select: [ :anRGMethodDef | (self methodIsOnBlacklist: anRGMethodDef) not]
	
]

{ #category : #filtering }
HaltManager class >> filterOutMethodsFromHaltManager: anOrderedCollectionOfRBMethodDefinition [
	^ anOrderedCollectionOfRBMethodDefinition 
			select: [ :anRGMethodDef |(anRGMethodDef package realPackage == self package) not ]
]

{ #category : #'world menu' }
HaltManager class >> menuCommandOn: aBuilder [
	"Add a custom menu item to the world menu"

	<worldMenu>
	(aBuilder item: #'Halt Manager')
		order: 0.42;
		iconName: #haltIcon;
		parent: #Tools;
		action: [ self open ]
]

{ #category : #filtering }
HaltManager class >> methodIsOnBlacklist: anRGMethodDef [
	^ self blacklist anySatisfy: [:classNameSymbolAndMethodNameSymbol |
			((anRGMethodDef realClass) = (self environment at: (classNameSymbolAndMethodNameSymbol at: 1) ifAbsent: [^false])) and: 
			[ anRGMethodDef name = (classNameSymbolAndMethodNameSymbol at: 2) ]
	].
]

{ #category : #'world menu' }
HaltManager class >> methodsToDisplay [
	| inactiveHaltsSelectors |
	inactiveHaltsSelectors := #(inactiveHalt inactiveHalt: inactiveHaltIf: inactiveHaltIfNil inactiveHaltOnCount: inactiveHaltOnce).
	^ SystemNavigation default allMethodsSelect: [ :aMethod | 
		aMethod hasBreakpoint or: [
		aMethod containsHalt or: [
		(aMethod method sendsAnySelectorOf: inactiveHaltsSelectors) or: [
		aMethod hasInactiveBreakpoint "or: [ 
		(InactiveHalt_Metalink inactiveHaltsInMethod: aMethod) isNotEmpty	
		]"
	]]]]
]

{ #category : #'world menu' }
HaltManager class >> open [
	<script>
	"Opens a method browser showing all methods containing breakpoints (and its flavours like break once), halts (and its flavours like haltOnce), inactive breakpoints (and flavours) and inactive halts (and flavours). Filter out such methods that belong to the HaltManager package."
	| b |
	b := ClyQueryBrowserMorph browseMethods: (self filterOutMethodsFromBlacklist: (self filterOutMethodsFromHaltManager: (self methodsToDisplay))) withTitle: 'Halt Manager'.
	b switchResultTo: (ClySortedQueryResult using: SortMethodsByPackageFunction new )
	
]

{ #category : #'world menu' }
HaltManager class >> openUnfiltered [
	<script>
	"Does the same as the openHaltManager method, without filtering out the methods from the HaltManager package"
	| b |
	b := ClyQueryBrowserMorph browseMethods: (self methodsToDisplay) withTitle: 'Halt Manager'.
	b switchResultTo: (ClySortedQueryResult using: SortMethodsByPackageFunction new )
]
