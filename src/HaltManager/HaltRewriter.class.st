"
I provide a method to rewrite a method's source code to change the selector of a given message node.
"
Class {
	#name : #HaltRewriter,
	#superclass : #Object,
	#category : #'HaltManager-Core'
}

{ #category : #'as yet unclassified' }
HaltRewriter class >> rewriteMessageNode: anRBMessageNode toChangeSelectorTo: aSymbol [
"Takes an ast node representing a message send, and rewrites the method this node belongs to change the selector of the message send"

		|rewriter newSourceCode methodNode methodClass compiledMethod methodParseTree|
		"Extract information"
		methodNode := anRBMessageNode methodNode.
		methodClass := methodNode methodClass.
		compiledMethod := methodClass >>((methodNode selector) asSymbol).
		
		"Produce new source code"
		rewriter := RBParseTreeRewriter new.
		rewriter replaceTree: anRBMessageNode withTree: (RBMessageNode receiver: anRBMessageNode receiver selector: aSymbol keywordsPositions: anRBMessageNode keywordsPositions arguments: anRBMessageNode arguments) when: [:node | node == anRBMessageNode].
		methodParseTree := compiledMethod ast.
		rewriter executeTree: methodParseTree.
		newSourceCode := methodParseTree formattedCode.
		
		"Compile new source code"
		methodClass
			compile: newSourceCode
			classified: compiledMethod protocol.

]
