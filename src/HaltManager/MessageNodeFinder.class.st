"
I provide a method to find message ast nodes satisfying a given condition in a given tree of ast nodes by using a visitor.
"
Class {
	#name : #MessageNodeFinder,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'messageNodeCheckingBlock',
		'resultMessageNodes'
	],
	#category : 'HaltManager'
}

{ #category : #'as yet unclassified' }
MessageNodeFinder class >> findMessageNodesSatisfying: aBlock inNode: anRBProgramNode [
	^ self new findMessageNodesSatisfying: aBlock inNode: anRBProgramNode.
]

{ #category : #main }
MessageNodeFinder >> findMessageNodesSatisfying: aBlock inNode: anRBProgramNode [
	messageNodeCheckingBlock := aBlock.
	anRBProgramNode acceptVisitor: self.
	^ resultMessageNodes.
]

{ #category : #initialization }
MessageNodeFinder >> initialize [
	resultMessageNodes := LinkedList new.
]

{ #category : #initialization }
MessageNodeFinder >> visitMessageNode: aMessageNode [
	(messageNodeCheckingBlock value: aMessageNode) ifTrue: [resultMessageNodes add: aMessageNode ].
	super visitMessageNode: aMessageNode.
]
