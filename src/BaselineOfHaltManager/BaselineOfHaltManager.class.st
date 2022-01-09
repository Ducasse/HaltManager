Class {
	#name : #BaselineOfHaltManager,
	#superclass : #BaselineOf,
	#category : 'BaselineOfHaltManager'
}

{ #category : #baselines }
BaselineOfHaltManager >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec package: #'HaltManager'.
	]
	
]
