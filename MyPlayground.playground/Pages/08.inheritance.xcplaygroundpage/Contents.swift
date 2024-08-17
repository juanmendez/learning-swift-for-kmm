//: [Previous](@previous)

import Foundation

class Vehicle {
    var currentSpeed = 0.0
    let decentSpeed = 30.0
    
    // a class, method, class variable having final do not allow to apply inheritance
    final var oldSpeed = 1.0
    
    func getName() -> String {
        ""
    }
}

class Bicycle: Vehicle {
    private var myOwnSpeed: Double = 0
    
    // whereas in Kotlin we only place override, in here we have to define the setter and getter..
    override var currentSpeed: Double {
        get {
            return myOwnSpeed
        }
        set {
            myOwnSpeed = newValue
        }
        
        // 'didSet' cannot be provided together with a getter
        /**
         didSet {
         
         }
         */
    }
    
    // Cannot override with a stored property 'oldSpeed'
    /**
     override oldSpeed: Double {
     
     }
     */
    
    // a read only cannot be overriden
    /*
    override var decentSpeed: Double {
        40.0
    }
    */
    
    override func getName() -> String {
        "Bicycle"
    }
}
