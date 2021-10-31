//
//  Tests.swift
//  Tests
//
//  Created by Juan Mendez on 9/9/21.
//  Copyright © 2021 Juan Mendez. All rights reserved.
//

import XCTest

/**
 It was very annoying I could not write a test pointing to the module easily.
 Each time I tried `@testable LearningSwift` it simply did not work.
 I ended up moving code from that module onto here to test.
*/

protocol Toggle {
    // mutating is needed when overriding
    mutating func toggle()
}

enum SwitchEnum: Toggle {
    case on
    case off

    // Cannot assign to property: 'self' is immutable; unless, you make it a mutable function
    // and make sure protocol also address it
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

struct SwitchStruct: Toggle {
    var value: Bool

    // if nothing here was mutating, we could simply start with func even if the protocol addresses it
    mutating func toggle() {
        value = !value
    }
}

class Tests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    // make sure methods have `test` as prefix
    func testEquality() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        var switchStruct = SwitchStruct(value: true)
        let copyOfSwitchStruct = switchStruct
        switchStruct.toggle()

        XCTAssertEqual(switchStruct.value, false, "Object toggled so it is false")
        XCTAssertEqual(copyOfSwitchStruct.value, true, "Copy is independent from object being toggled")
    }

    func testBool() {
        var switchStruct = SwitchStruct(value: true)
        let copyOfSwitchStruct = switchStruct
        switchStruct.toggle()

        XCTAssertFalse(switchStruct.value)
        XCTAssert(copyOfSwitchStruct.value)
    }

    func testNullability() {
        var hello: String?

        XCTAssertNil(hello, "Object is not being defined yet")
    }

    func testValue() {
        var hello: String?
        hello = "Hello World"

        XCTAssertNotNil(hello)
    }
}
