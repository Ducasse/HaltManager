"
My class side allows to:
- deactivate breakpoints, replacing them with metalinks that do not do anything and are just present to mark the position of an inactive breakpoint (so that it can be displayed in code browsers, and an option to reactivate it offerred in the ui)
- reactivate inactive breakpoints, restoring the original breakpoint
- keep track of all the inactive breakpoints in the system, and keep this list up to date when some inactive breakpoints are removed due to being in methods being modified, method being removed, or method being in classes being removed

class variables:
- allInactiveBreakpoints <LinkedList of InactiveBreakpoint>

My instances are representations of these inactive breakpoints, and hold references to  a) the corresponding original breakpoint that was deactivated and b) to the metalink added to the node this breakpoint was attached to marking the position of the inactive breakpoint

instance variables:
- correspondingActiveBreakpoint <Breakpoint> see a) above
- link <Metalink> see b) above
"
Class {
	#name : #InactiveBreakpoint,
	#superclass : #Object,
	#instVars : [
		'correspondingActiveBreakpoint',
		'link'
	],
	#classVars : [
		'allInactiveBreakpoints'
	],
	#category : #'HaltManager-Core'
}

{ #category : #accessing }
InactiveBreakpoint class >> allInactiveBreakpoints [
	^allInactiveBreakpoints
]

{ #category : #all }
InactiveBreakpoint class >> browseAll [
	<script>
	| methods |
	"methods := allInactiveBreakpoints flatCollect: [ :inactiveBreakpoint | inactiveBreakpoint correspondingActiveBreakpoint link methods ]."
	methods := allInactiveBreakpoints flatCollect: [ :inactiveBreakpoint | inactiveBreakpoint link methods].
	"methods := SystemNavigation allMethods select: [ :aMethod | self isInstalledIn: aMethod ]."
	Smalltalk tools messageList browse: methods
]

{ #category : #'deactivation reactivation' }
InactiveBreakpoint class >> deactivateBreakpointFromNode: aNode [
	|activeBreakpoint inactiveBreakpoint|
	activeBreakpoint := (((Breakpoint classVariableNamed: 'AllBreakpoints') value) select: [ :aBreakpoint | aBreakpoint node == aNode. ]) first.
	inactiveBreakpoint := InactiveBreakpoint new correspondingActiveBreakpoint: activeBreakpoint.
	inactiveBreakpoint install.
	Breakpoint removeFrom: aNode.
	^ inactiveBreakpoint.
]

{ #category : #'system announcements' }
InactiveBreakpoint class >> handleClassRemoved: anAnnouncement [
	allInactiveBreakpoints copy do: [ :inBreakpoint |
		inBreakpoint link methods
			detect: [ :m | m methodClass = anAnnouncement classRemoved ]
			ifFound: [ allInactiveBreakpoints remove: inBreakpoint ] ]
]

{ #category : #'system announcements' }
InactiveBreakpoint class >> handleMethodModified: anAnnouncement [
	self removeInactiveBreakpointsFromMethod: anAnnouncement oldMethod
]

{ #category : #'system announcements' }
InactiveBreakpoint class >> handleMethodRemoved: anAnnouncement [
	self removeInactiveBreakpointsFromMethod: anAnnouncement method
]

{ #category : #accessing }
InactiveBreakpoint class >> initialize [
	allInactiveBreakpoints := OrderedCollection new.
	self registerInterestToSystemAnnouncement
]

{ #category : #testing }
InactiveBreakpoint class >> isInstalledIn: aMethod [
	self allInactiveBreakpoints do: [ :inactiveBreakpoint |
		inactiveBreakpoint link methods 
			detect: [ :m | m == aMethod ]
			ifFound: [ ^ true ]
	].

	^ false
]

{ #category : #'deactivation reactivation' }
InactiveBreakpoint class >> reactivateBreakpointFromNode: aNode [
	|inactiveBreakpoint|
	inactiveBreakpoint  := (allInactiveBreakpoints select: [ :inactiveBr | inactiveBr correspondingActiveBreakpoint node == aNode]) first.
	inactiveBreakpoint remove.
	inactiveBreakpoint correspondingActiveBreakpoint install.
]

{ #category : #'system announcements' }
InactiveBreakpoint class >> registerInterestToSystemAnnouncement [
	<systemEventRegistration>
	SystemAnnouncer uniqueInstance
		unsubscribe: self.
	SystemAnnouncer uniqueInstance weak subscribe: MethodRemoved send: #handleMethodRemoved: to: self.
	SystemAnnouncer uniqueInstance weak subscribe: MethodModified send: #handleMethodModified: to: self.
	SystemAnnouncer uniqueInstance weak subscribe: ClassRemoved send: #handleClassRemoved: to: self.
]

{ #category : #removing }
InactiveBreakpoint class >> removeAll [ 
	<script>
	allInactiveBreakpoints copy do: #remove.
]

{ #category : #removing }
InactiveBreakpoint class >> removeFrom: aNode [
	| links breakpointsToRemove |
	links := aNode beforeLinks select: [ :link | link metaObject = InactiveBreakpointMetalinkTargetException].
	breakpointsToRemove := self allInactiveBreakpoints select: [ :br | links includes: br link].
	breakpointsToRemove do: #remove.
]

{ #category : #removing }
InactiveBreakpoint class >> removeInactiveBreakpointsFromMethod: aMethod [ 
	allInactiveBreakpoints copy do: [ :inBreakpoint |
		inBreakpoint link methods
			detect: [ :m | m == aMethod ]
			ifFound: [ allInactiveBreakpoints remove: inBreakpoint ] ]
]

{ #category : #accessing }
InactiveBreakpoint >> correspondingActiveBreakpoint [
	^ correspondingActiveBreakpoint
]

{ #category : #accessing }
InactiveBreakpoint >> correspondingActiveBreakpoint: anObject [
	correspondingActiveBreakpoint := anObject
]

{ #category : #accessing }
InactiveBreakpoint >> inactiveBreakLink [
	^ MetaLink new
		metaObject: InactiveBreakpointMetalinkTargetException;
		selector: #doNotBreak";
		options: options"
]

{ #category : #installation }
InactiveBreakpoint >> install [
	allInactiveBreakpoints add: self.
	self correspondingActiveBreakpoint node link: self link.
]

{ #category : #accessing }
InactiveBreakpoint >> link [
	^ link ifNil: [link := self inactiveBreakLink]
]

{ #category : #accessing }
InactiveBreakpoint >> link: anObject [
	link := anObject
]

{ #category : #installation }
InactiveBreakpoint >> remove [
	allInactiveBreakpoints remove: self.
	link uninstall
]
