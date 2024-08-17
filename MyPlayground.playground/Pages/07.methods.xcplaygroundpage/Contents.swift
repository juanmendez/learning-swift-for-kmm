//: [Previous](@previous)

import Foundation

class SomeClass {
    static var name = ""
    
    // the advantage of class type method is self as reference to the class itself
    class func someTypeMethod() {
        self.name = "hello"
    }
}

class SomeSubclass: SomeClass {
    
    override class func someTypeMethod() {
        self.name = "nom"
    }
}


SomeSubclass.someTypeMethod()
print(SomeClass.name)
