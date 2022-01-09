"
My class side allows to:
- deactivate halts (and its flavours like haltOnCOunt:, haltIf: ...), by adding metalinks removing the bytecode of these halts to their corresponding ast nodes.
- reactivate halts (and its flavours) that have been deactivated by the addition of a metalink, restoring the original behaviour of the halt.
- keep track of all the inactive halts (and their corresponding metalinks) in the system, and keep this list up to date when some of their metalinks are removed due to being in methods being modified, method being removed, or method being in classes being removed

class variables:
- allInactiveHalts: <LinkedList of InactiveHalt_Metalink>  All the InactiveHalts_Metalink currently active in the system.

My instances are representations of these inactive halts, and hold references to  a) the corresponding ast node of the halt that was deactivated and b) to the metalink added to the halt ast node to prevent it from halting the execution.

instance variables:
- correspondingHaltNode: <RBMessageNode> see a) above
- link <Metalink> see b) above
"
Class {
	#name : #'InactiveHalt_Metalink',
	#superclass : #Object,
	#instVars : [
		'link',
		'correspondingHaltNode'
	],
	#classVars : [
		'allInactiveHalts'
	],
	#category : #'HaltManager-Core'
}

{ #category : #accessing }
InactiveHalt_Metalink class >> allInactiveHalts [
	^ allInactiveHalts
]

{ #category : #accessing }
InactiveHalt_Metalink class >> browseAll [
	<script>
	| methods |
	methods := allInactiveHalts flatCollect: [ :inactiveHalt | inactiveHalt link methods].
	Smalltalk tools messageList browse: methods.
]

{ #category : #'deactivation reactivation' }
InactiveHalt_Metalink class >> deactivateHaltNode: aNode [
	|inactiveHalt|
	inactiveHalt := InactiveHalt_Metalink new correspondingHaltNode: aNode.
	inactiveHalt installLink.
	allInactiveHalts add: inactiveHalt.
]

{ #category : #'update on announcement' }
InactiveHalt_Metalink class >> handleClassRemoved: anAnnouncement [
	allInactiveHalts copy do: [ :inHalt |
		inHalt link methods
			detect: [ :m | m methodClass = anAnnouncement classRemoved ]
			ifFound: [ allInactiveHalts remove: inHalt ] ]
]

{ #category : #'update on announcement' }
InactiveHalt_Metalink class >> handleMethodModified: anAnnouncement [
	self removeInactiveHaltsInMethod: anAnnouncement oldMethod
]

{ #category : #'update on announcement' }
InactiveHalt_Metalink class >> handleMethodRemoved: anAnnouncement [
	self removeInactiveHaltsInMethod: anAnnouncement method
]

{ #category : #accessing }
InactiveHalt_Metalink class >> inactiveHaltsInMethod: aMethod [ 
	^allInactiveHalts select: [ :inHalt |
		inHalt link methods anySatisfy: [ :meth | meth == aMethod ]
	]
]

{ #category : #initialization }
InactiveHalt_Metalink class >> initialize [
	allInactiveHalts := LinkedList new.
	self registerInterestToSystemAnnouncement.
]

{ #category : #dustbin }
InactiveHalt_Metalink class >> isHaltMessageNodeInactive: aNode [
	^ allInactiveHalts anySatisfy: [ :inacHalt | inacHalt correspondingHaltNode == aNode].
]

{ #category : #'deactivation reactivation' }
InactiveHalt_Metalink class >> reactivateHaltNode: aNode [
	|inactiveHalt|
	inactiveHalt := (allInactiveHalts select: [ :inacHalt | inacHalt correspondingHaltNode == aNode]) first.
	inactiveHalt uninstallLink.
	allInactiveHalts remove: inactiveHalt.
]

{ #category : #initialization }
InactiveHalt_Metalink class >> registerInterestToSystemAnnouncement [
	<systemEventRegistration>
	
	SystemAnnouncer uniqueInstance unsubscribe: self.
	SystemAnnouncer uniqueInstance weak when: MethodRemoved send: #handleMethodRemoved: to: self.
	SystemAnnouncer uniqueInstance weak when: MethodModified send: #handleMethodModified: to: self.
	SystemAnnouncer uniqueInstance weak when: ClassRemoved send: #handleClassRemoved: to: self.
]

{ #category : #removing }
InactiveHalt_Metalink class >> removeAll [ 
	<script>
	allInactiveHalts copy do: [:elem | elem uninstallLink].
	allInactiveHalts := LinkedList new.
]

{ #category : #removing }
InactiveHalt_Metalink class >> removeInactiveHalt: anInactiveHalt [
	anInactiveHalt uninstallLink.
	allInactiveHalts remove: anInactiveHalt.
]

{ #category : #removing }
InactiveHalt_Metalink class >> removeInactiveHaltsInMethod: aMethod [
	|inactiveHaltsInMethod|
	inactiveHaltsInMethod := self inactiveHaltsInMethod: aMethod.
	inactiveHaltsInMethod do: [ :inHalt | self removeInactiveHalt: inHalt ].
	"allInactiveHalts copy do: [ :inHalt |
		inHalt link methods
			detect: [ :m | m == aMethod ]
			ifFound: [ allInactiveHalts remove: inHalt ] ]"
]

{ #category : #accessing }
InactiveHalt_Metalink >> correspondingHaltNode [
	^ correspondingHaltNode
]

{ #category : #accessing }
InactiveHalt_Metalink >> correspondingHaltNode: anObject [
	correspondingHaltNode := anObject
]

{ #category : #accessing }
InactiveHalt_Metalink >> emptyReplacementLink [
	^ MetaLink new
		metaObject: InactiveHalt_MetalinkTarget ;
		selector: #doNotBreak;
		control: #instead;
		options: #(optionCompileOnLinkInstallation).
]

{ #category : #'as yet unclassified' }
InactiveHalt_Metalink >> installLink [
	self correspondingHaltNode link: self link.
]

{ #category : #accessing }
InactiveHalt_Metalink >> link [
	^ link ifNil: [link := self emptyReplacementLink]
]

{ #category : #accessing }
InactiveHalt_Metalink >> link: anObject [
	link := anObject
]

{ #category : #'as yet unclassified' }
InactiveHalt_Metalink >> uninstallLink [
	self link uninstall.
]
