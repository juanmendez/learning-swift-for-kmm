//
//  Dog.swift
//  MyApp
//
//  Created by Mendez, Juan on 1/13/25.
//
class Dog: Animal {
    var name: String
    var age: Int
    var weight: Double
    var region: String
    
    init(name: String = "", age: Int = 0, weight: Double = 0.0, region: String = "") {
        self.name = name
        self.age = age
        self.weight = weight
        self.region = region
    }
    
    
    func sayHello() -> String {
        """
        Doggie \(name) says hello, I live in \(region)
        Currently I am \(age) years old 
        and weigh \(weight) pounds
        """
    }
}
