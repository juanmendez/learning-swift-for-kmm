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

empty += oneDouble
empty += twoDouble

var shoppingList = [ "Eggs", "Milk"]
shoppingList += ["Coffee", "Beans"]
shoppingList.append("Onions")
print("shooping list \(shoppingList)")


if shoppingList.contains([ "Eggs", "Milk", "Beans", "Coffee"]) {
    print("you are ready for breakfast")
} else {
    print("you are ready for lunch")
}

for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1) : \(value)")
}

// SET
var letters = Set<String>()
letters.insert("A")
letters.insert("B")
letters.insert("C")
letters.insert("D")
letters.insert("A")
print("set is \(letters)")

if let theZLetter = letters.remove("Z") {
    print(":)")
} else {
    print(":(")
}


var airports = [ "ord": "Chicago", "mty": "Monterrey", "gua": "Guatemala city" ]
airports["pty"] = "Panama city"

if airports.isEmpty {
    print("aiports is empty")
} else {
    print("airport is not empty")
}

/**
 airports["DUB"]?.let { airportName ->
  print("The name of the airport is $airportName).")
 } ?: run {
  print("That airport isn't in the airports dictionary.")
 }
 */

if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport isn't in the airports dictionary.")
}


for entry in airports {
    print("\(entry.key): \(entry.value)")
}

for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}
