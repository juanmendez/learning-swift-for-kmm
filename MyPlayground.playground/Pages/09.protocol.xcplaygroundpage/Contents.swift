//: [Previous](@previous)

/**
 It is very interesting how a protool can have as a contract constructor definition, static members.
I have never seen enums also implementing a protocol in any language.. that is very new to me..
 */

import Foundation

protocol Vehicle {
    static var NAME: String { get set }
    var wheels: Int { get }
    func getName() -> String
}

class Bicycle: Vehicle {
    static var NAME: String = ""
    private var _wheels = 0
    private var _name = ""
    
    init(_ wheels: Int = 0, _ name: String = "") {
        _wheels = wheels
        _name = name
    }
    
    var wheels : Int {
        _wheels
    }
    
    func getName() -> String {
        _name
    }
}


let bicycle = Bicycle(2, "Shimano")
print("This bicycle is a \(bicycle.getName()) and has \(bicycle.wheels) wheels")


// Also how enums rather than holding a specific value per instance, here the enums can already be based on a given type.
protocol Togglable {
    var value: String { get }
    mutating func toggle()
}

enum OnOffSwitch: String, Togglable {
    case off = "apagado"
    case on = "encendido"
    mutating func toggle() {
        switch self {
            case .off:
                self = .on
            case .on:
                self = .off
        }
    }
    
    var value: String {
        self.rawValue
    }
}
var lightSwitch = OnOffSwitch.off
print("switch is \(lightSwitch.value)")

lightSwitch.toggle()
print("switch is \(lightSwitch.value)")


protocol MechanicVehicle: Vehicle {
    init(brand: String)
}


class Car: MechanicVehicle {
    static var NAME: String = "Car"
    private var brand = ""
    
    required init(brand: String ){
        self.brand = brand
    }
    
    var wheels : Int = 0
    
    func getName() -> String {
        brand
    }
}

let car = Car(brand: "Subaru")
car.wheels = 4
print("This car is a \(car.getName()) and has \(car.wheels) wheels")


class LinearCongruentialGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c)
            .truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}

protocol Sum: AnyObject {
    var sum: Int { get }
    func add(_ number1: Int, _ number2: Int) -> Int
}

class Accumulation: Sum {
    
    weak var delegate: Sum?
    
    init() {}
    
    init(_ myDelegate: Sum) {
        self.delegate = myDelegate
    }
    
    var sum: Int {
        delegate?.sum ?? 0
    }
    
    func add(_ number1: Int, _ number2: Int) -> Int {
        delegate?.add(number1, number2) ?? 0
    }
}

class InternalAccumulation: Sum {
    // I like how internally sum is a var, but outside of its scope it is a read only sum variable.
    var sum : Int = 0
    
    func add(_ number1: Int, _ number2: Int) -> Int {
        sum = sum + number1 + number2
        return sum
    }
}

let mySum = InternalAccumulation()
let myAccumulation = Accumulation()
myAccumulation.delegate =  mySum
myAccumulation.add(1, 2)
print( myAccumulation.sum)

// here comes extension to a protocol
extension Sum {
    func substraction(_ number1: Int) -> Int {
        sum - number1
    }
}

print( myAccumulation.substraction(3) )


extension Array where Element: Sum {
    var description: String {
        "hello, there are \(self.count) items of type Sum in here"
    }
}

let mySums = [Accumulation(), Accumulation(), Accumulation()]
print("greetings from \(mySums.description)")

// optional methods in a protocol
@objc protocol Substraction {
    @objc optional var value: Int { get }
    @objc optional func substract(_ number1: Int) -> Int
}

class EmptySubstraction: Substraction {
    
}


class MySubstraction1: Substraction {
    var value: Int = 0
}

class MySubstraction2: Substraction {
    func substract(_ number1: Int) -> Int {
        0
    }
}

let emptySubstraction = MySubstraction1()
emptySubstraction.value

extension RandomNumberGenerator {
    
}

