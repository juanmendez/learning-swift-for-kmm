//: [Previous](@previous)

import Foundation

enum CompassPoint {
    case north, south, east, west
}

var directionToHead: CompassPoint
// inferred assignments
directionToHead = .south
directionToHead = .west

switch directionToHead {
    case .north:
        print("Lots of planets have a north")
    case .south:
        print("Watch out for penguins")
    case .east:
        print("Where the sun rises")
    case .west:
        print("Where the skies are blue")
}

enum CompassPointValue: CaseIterable {
    case north, south, east, west
}

print("\(CompassPointValue.allCases.count) compass points available")

for compassPoint in CompassPointValue.allCases {
    print(compassPoint)
}


enum Vehicle {
    case Car(String, String, Int)
    case Bicycle(String)
    case Airplan(String, String)
}

let car = Vehicle.Car("Subaru", "Forester", 2013)
let bicycle = Vehicle.Bicycle("Shimano")
let airplan = Vehicle.Airplan("Japan Airlines", "JAL-1234")
var vehicle: Vehicle = airplan

switch vehicle  {
    case .Car( let make, let model, let year) : print("car \(make) \(model) \(year)")
    case .Bicycle(let make) : print("make \(make)")
    case .Airplan(let airline, let flight) : print("airplaine \(airline) in flight number: \(flight)")
}



enum Shapes: Int {
    case square = 1
    case circle = 2
    case parallelogram = 3
    case triangle = 4
}


print("a squre has value \(Shapes.square.rawValue)")
print("a circle has value \(Shapes.circle.rawValue)")
print("a parallelogram has value \(Shapes.parallelogram.rawValue)")

// implicit raw value

enum ImplicitShapes: Int {
    case square = 1, circle, parallelogram, triangle
}

print("a squre has value \(ImplicitShapes.square.rawValue)")
print("a circle has value \(ImplicitShapes.circle.rawValue)")
print("a parallelogram has value \(ImplicitShapes.parallelogram.rawValue)")


enum ImplicitStringShapes: String {
    case square, circle, parallelogram, triangle
}

print("a squre has value \(ImplicitStringShapes.square.rawValue)")
print("a circle has value \(ImplicitStringShapes.circle.rawValue)")
print("a parallelogram has value \(ImplicitStringShapes.parallelogram.rawValue)")

print("getting the enum \(String(describing: ImplicitShapes(rawValue: 3)))")


