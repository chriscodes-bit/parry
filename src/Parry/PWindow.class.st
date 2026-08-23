"
The Parry Editor
"
Class {
	#name : 'PWindow',
	#superclass : 'SpPresenter',
	#instVars : [
		'parry',
		'textInput',
		'clickButton'
	],
	#category : 'Parry',
	#package : 'Parry'
}

{ #category : 'initialization' }
PWindow >> initializePresenters [
	"Instantiate individual Spec2 components"

	super initializePresenters.
	textInput := self newText.
	textInput text: 'Parry Code goes here'.

	clickButton := self newButton.
	clickButton label: 'Run'.

	"Define layout placement (Vertical Box layout)"
	self layout: (SpBoxLayout newTopToBottom
			 add: textInput;
			 add: clickButton expand: false;
			 "Button takes fixed native height"yourself).

	"Define interaction behavior"
	clickButton action: [ self inform: (parry tokenize: (textInput text string)) ]
]

{ #category : 'initialization' }
PWindow >> initializeWindow: aWindowPresenter [
	"Set up the system window properties"

	super initializeWindow: aWindowPresenter.
	parry := PInterpreter new.
	aWindowPresenter
		title: 'Parry Interpreter';
		initialExtent: 400 @ 300
]
