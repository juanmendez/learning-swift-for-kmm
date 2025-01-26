//
//  SwiftTeting101g.swift
//  unit testing
//
//  Created by Mendez, Juan on 1/13/25.
//
import Testing

struct SwiftTeting101 {
    
    @Test
    func testMeDear() {
        let errorAnimal = ErrorAnimal()
        
        #expect(throws: AnimalError.self) {
            try errorAnimal.makeError(byPassError: false)
        }
        
        #expect(throws: Never.self) {
            try errorAnimal.makeError(byPassError: true)
        }
    }

    @Test
    func testExample() {
        #expect(greet() == "Hola Mundo de XCTest")
    }

    @Test
    func testDog() {
        let dog = Dog()
        #expect(dog.name == "")
        #expect(dog.age == 0)
        #expect(dog.region == "")
        #expect(dog.weight == 0)
    }

    /// This method shows how to run a test with Swift Testing
    ///
    /// - Parameters:
    ///   - videoName: an intererate string provided by Test arguments
    /// - See: https://developer.apple.com/xcode/swift-testing/
    @Test("Fun places", arguments: [
        "A Beach",
        "By the Lake",
        "Camping in the Woods"
    ])
    func testFunPlaces(myFunPlace: String) async throws {
        #expect(!myFunPlace.isEmpty)
    }

    @Test
    func testGreaterThan() async throws {
        #expect(2 > 1)
    }
}
