//
//  unit_testing.swift
//  unit testing
//
//  Created by Mendez, Juan on 1/13/25.
//

import XCTest
import Testing

final class Testing101: XCTestCase {
    override func setUp() async throws {

    }

    func testMeDear() {
        let errorAnimal = ErrorAnimal()

        XCTAssertThrowsError(try errorAnimal.makeError(byPassError: false)) { error in
            XCTAssertEqual(String(describing: error), "AnimalError()")
        }

        XCTAssertNoThrow(try errorAnimal.makeError(byPassError: true), "check calling method does not throw an error")
    }

    func testExample() {
        XCTAssertEqual(greet(), "Hola Mundo de XCTest")
    }

    func testDog() {
        let dog = Dog()
        XCTAssertEqual(dog.name, "")
        XCTAssertEqual(dog.age, 0)
        XCTAssertEqual(dog.weight, 0)
        XCTAssertEqual(dog.region, "")
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
    func testFunPlaces(videoName: String) async throws {
        assert(!videoName.isEmpty)
    }

    func testGreaterThan() async throws {
        XCTAssertGreaterThan(2, 1)
    }

    override func tearDown() async throws {

    }
}
