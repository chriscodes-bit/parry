"
Interpreter Logic for Parry
"
Class {
	#name : 'PInterpreter',
	#superclass : 'Object',
	#instVars : [
		'stack'
	],
	#category : 'Parry',
	#package : 'Parry'
}

{ #category : 'initialization' }
PInterpreter >> initialize [

	super initialize.
	stack := OrderedCollection new.
]

{ #category : 'accessing' }
PInterpreter >> peek [
    Transcript show: (' ' join: (stack collect: #printString)); cr.
    ^ stack
]

{ #category : 'removing' }
PInterpreter >> pop [

	stack removeLast 
]

{ #category : 'adding' }
PInterpreter >> push: aNumber [

	stack add: aNumber yourself
]

{ #category : 'parsing' }
PInterpreter >> tokenize: aString [
	^ aString splitOn: ' '
]
