let a = 5
let b = 2

let myResult = a/b

print(type(of: myResult))

let myDoubleResult = Double(a/b) // (a/b).toDouble() in Kotlin
print(type(of: myDoubleResult))

var maybeNil: String?


// observe condition has no need for parenthesis
if maybeNil == nil {
    print("not defined")
}


// casting
let doubleGold = 5.832
let intGold = Int(doubleGold)
let stringGold = String(doubleGold)
let mixedGold = doubleGold + Double(intGold) // ensure integer is double

print("converted values \(doubleGold) \(intGold) \(stringGold) \(mixedGold)")

var isActive = false
isActive = !isActive
print("value must be true \(isActive)")

func isStringEven(value: String) -> Bool {
    value.count % 2 == 0
}

var unknown: String?
unknown = "5678"
print(isStringEven(value: unknown ?? "1234"))
