// assignment condition
// whenever there is an assignment and it works, then it is treated as true
if let a = Int("0") {
    print("conversion from string to int worked")
}

if let b = Int("s") {
    print("conversion from string to int worked")
} else {
    print("this conversion doesn't work")
}

// a chain of conditions
/**
 if let c = Int("0") {
    if let d = Int("1") {
        if 1 == 1 {
         }
    }
 }
 */

var d: String?
d = "1"

if let c = Int("0"), let safeD = d, 1 == 1 {
    print("this chain of conditions works \(c) \(safeD)")
} else {
    // this gets executed if d is null, or nil.
    print("this chain of conditions doesn't work")
}