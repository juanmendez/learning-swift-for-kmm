if 1 < 2 {
    print("1 is less than 2")
}

// fall-throughs are not allowed..
switch 4 {
case 0:
    // these two lines can't be written one next to the other
    print("0")
    print("zero")
case 1: print("1")
case 2: print("2")
default: print("higher than 2")
}

// loops
var i = 0;

// again no need for enclosing parenthesis
while i < 4 {
    i += 1
    // how to use interpolation in swift?
    // for dart or kotlin, only replace $ for \
    print("while loop: \(i)")
}

let values = [0, 1, 2, 3, 4, 5]

// once again, no need for closing parenthesis.
// by the way for var loops don't work in swift.
for value in values {
    print("for in loop: \(value)")
}

// 0 to 10
// CloseRange<Int>
let rangeValues = 0...10

for value in rangeValues {
    print("for in with close range: \(value)")
}


// 0 to 9
// Range<Int>
let halfOpenValues = 0..<10

for value in halfOpenValues {
    print("for in with range: \(value)")
}


// what is nice is the code hints, and I  tabbed to move to each parameter
for value in stride(from: 0, through: 100, by: 5) {
    print("using a fancy method to loop: \(value)")
}

func isNullWhenItsOdd(value: Int? = nil) -> Int? {
    // this is like having an if condition checking is not null, to then assign it to another variable
    guard let safeValue = value else {
        return nil;
    }

    if safeValue % 2 == 0 {
        return value
    }

    return nil;
}

print("is it even \(String(describing: isNullWhenItsOdd(value: 2)))")

// when value assigned assigned is not null, then condition is true
if let asNil = isNullWhenItsOdd() {
    print("value is even \(asNil)")
}

if let asNil = isNullWhenItsOdd(value: 3) {
    print("value is even \(asNil)")
}

if let asInt = isNullWhenItsOdd(value: 2) {
    print("value is even \(asInt)")
}
