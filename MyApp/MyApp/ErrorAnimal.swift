//
//  ErrorAnimal.swift
//  MyApp
//
//  Created by Mendez, Juan on 1/13/25.
//
class ErrorAnimal: Animal {
    var weight: Double

    var region: String

    var name: String
    var age: Int

    init(name: String = "", age: Int = 0, weight: Double = 0.0, region: String = "") {
        self.name = name
        self.age = age
        self.weight = weight
        self.region = region
    }

    func sayHello() -> String {
        return "Error Animal"
    }

    func makeError(byPassError: Bool) throws (AnimalError) -> String {
        guard byPassError else {
            throw AnimalError()
        }
        return "Some Error"
    }
}