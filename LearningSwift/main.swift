// here a: List<Int> is declared a: [Int] or Array<Int>
var a: Array<Int> = [ 1, 2, 3, 4, 5, ]
a.append(7) // wont work with a final a
a.removeLast()

a += [ 6, 7, 8, 9,]

print(a)

// Array<Int>
print(type(of: a))

// declare an empty integer array
var b : [Int] = []
b.append(2)

// declare an immutable array
let c : [Int] = []

// cannot use mutating member in an inmutable array
// c.append(3)
