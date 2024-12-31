//: [Previous](@previous)

import Foundation

// How do I rename a playground page? I cannot just do this as simple as in JetBrains!

/**
 Types in Swift are similar to Kotlin..
 `is` for checking type
 `as` to cast
 `as?` to check if object is of given type   `
 */

struct BlackjackCard {
    // nested Suit enumeration
    enum Suit: Character {
        case spades = "♠", hearts = "♡", diamonds = "♢", clubs = "♣"
    }
    
    
    // nested Rank enumeration
    enum Rank: Int {
        case two = 2, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king, ace
        struct Values {
            let first: Int, second: Int?
        }
        
        var values: Values {
            switch self {
                case .ace:
                    return Values(first: 1, second: 11)
                case .jack, .queen, .king:
                    return Values(first: 10, second: nil)
                default:
                    return Values(first: self.rawValue, second: nil)
            }
        }
    }
    
    
    // BlackjackCard properties and methods
    let rank: Rank, suit: Suit
    
    var description: String {
        var output = "suit is \(suit.rawValue),"
        output += " value is \(rank.values.first)"
        if let second = rank.values.second {
            output += " or \(second)"
        }
        return output
    }
}

let theAceOfSpaces = BlackjackCard( rank: .ace, suit: .spades)
print("the ace of spaces \(theAceOfSpaces.description)")


struct OuterStruct {
    struct Values {
        let myEnum: NestedEnum, myStruct: NestedStruct
    }
    
    // Nested enum
    enum NestedEnum {
        case caseOne
        case caseTwo
    }
    
    // Nested struct
    struct NestedStruct {
        var value: Int
    }
    
    // Property using nested enum
    let enumValue: NestedEnum
    
    // Property using nested struct
    let structValue: NestedStruct
    
    private var values: Values {
        Values(myEnum: enumValue, myStruct: structValue)
    }
    
    var description: String {
        "values of outer struct \(values.myEnum), \(values.myStruct)"
    }
}

// no need to type OuterStruct.NestedEnum.caseOne... it is inferred.
let outerInstance = OuterStruct(enumValue: .caseOne, structValue: OuterStruct.NestedStruct(value: 10))
print("values of outer instance \(outerInstance.description)")
