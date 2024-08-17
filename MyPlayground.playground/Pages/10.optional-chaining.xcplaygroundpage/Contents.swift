//: [Previous](@previous)

import Foundation

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    var myCaller: (() -> String)? = nil
    func buildingIdentifier() -> String? {
        if let safeBuildingNumber = buildingNumber, let safeStreet = street {
            return "\(safeBuildingNumber) \(safeStreet)"
        } else if let safeBuildingName = buildingName {
            return safeBuildingName
        } else {
            return nil
        }
    }
}

let address = Address()
address.buildingName = "building name"
address.street = "3134 W. Wilson"

print( address.buildingIdentifier() ?? "none" )
print( address.street ?? "no address")

let myMap: [String:String] = ["key":"value"]
let myKey2Value = myMap["myKey2"] ?? "no value"

let myComplexMap: [String: [String: String?]] = ["key": ["key2": "value"]]

if let complexKeyValue = myComplexMap["key"]?["key2"] ?? nil {
    print("complex value \(complexKeyValue)")
} else {
    print("empty key value")
}

if let safeBuildNumber = address.buildingNumber {
    print("build number \(safeBuildNumber)")
} else {
    print("build number not found")
}


address.myCaller = { "hello" }

if let safeResponse = address.myCaller?() {
    print("response \(safeResponse)")
} else {
    print("no response")
}
