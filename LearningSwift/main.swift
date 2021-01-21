import Foundation

// initial type without defining the type in the variable
var playerName = "Ava"
var editsPermitted = true
var maximumPixelWidth = 38.4

// cannot then assign int to a type String
// playerName = 0

// type annotation
// in Kotlin we cannot let a var like that we need to describe it as a `lateinit var x`
var bonusScore: Int
var environment: String
var levelCompleted: Bool
var progress: Double

// final vars are written with let
let myMessage = "Hello"

// Cannot assign to value: 'myMessage' is a 'let' constant
// myMessage = "Hola"

