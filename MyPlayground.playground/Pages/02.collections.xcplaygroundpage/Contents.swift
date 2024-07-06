// My Playground
import Cocoa


// While in Kotlin we use MutableMap, Swift uses var to indicate it is a mutable dictionary..
var interestingNumbers : Dictionary<String, [Int]> = [:]


interestingNumbers["Prime"] = [2, 3, 5, 7, 11, 13]
interestingNumbers["Fibonacci"] =  [1, 1, 2, 3, 5, 35]
interestingNumbers["Square"] = [1, 4, 9, 16, 25]


var largest = 0
for (_, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}

var longestWord = ""

for (key, _)  in interestingNumbers {
    if(key.count > longestWord.count) {
        longestWord = key
    }
}


print("largest number \(largest)")
print("longest word \(longestWord)")


var empty: [Double] = []
let oneDouble = [ 0.0, 0.1, 0.2 ]
let twoDouble = [ 0.3, 0.4, 0.5 ]
let threDouble = oneDouble + twoDouble

empty.insert(contentsOf: oneDouble, at: 0)
empty.insert(contentsOf: twoDouble, at: empty.count - 1)
let shoppingList = [ "Eggs", "Milk"]

if shoppingList.contains([ "Eggs", "Milk", "Beans", "Coffee"]) {
    print("you are ready for breakfast")
} else {
    print("you are ready for lunch")
}







