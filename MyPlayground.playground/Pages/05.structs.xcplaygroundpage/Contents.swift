//: [Previous](@previous)

import Foundation

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

// interesting, if this was Kotlin, we would be ok to use val and still assign new value to height..
// bot not here. I had to switch to var instead.
var resolution = Resolution(width: 100, height: 200)
resolution.height = 300

// this is a copy of the original instance, so making changes go in the second instance only..
var resolutionReference = resolution
resolutionReference.height = 400

// see how both don't have the same height
print("resolution \(resolution.width) \(resolution.height)")
print("resolutionReference \(resolutionReference.width) \(resolutionReference.height)")


// copying also works with enums
enum CompassPoint {
    case north, south, east, west
    mutating func turnNorth() {
        self = .north
    }
}
var currentDirection = CompassPoint.west
let rememberedDirection = currentDirection
currentDirection.turnNorth()

// two instances which are initial the same, but then first one is modified
print("The current direction is \(currentDirection)")
print("The remembered direction is \(rememberedDirection)")

// same case
var string = "hello"
var stringReference = string
stringReference = "hola"

print("string is \(string)")
print("stringReference is \(stringReference)")


// Classes are reference types so they don't make new copies, like value types above
let videoMode = VideoMode()
var videoModeRef = videoMode
videoModeRef.frameRate = 10.0

print("frame rate for viewMode \(videoMode.frameRate)")

let videoModeRef2 = VideoMode()
videoModeRef2.frameRate = 10.0

// same as in PHP..
if videoModeRef === videoModeRef2 {
    print("same object")
} else {
    print("not the same object")
}
