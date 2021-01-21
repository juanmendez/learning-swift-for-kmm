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