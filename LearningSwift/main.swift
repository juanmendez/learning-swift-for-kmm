func showMessage() {
    print("hello world")
}

showMessage()


// method comes with named args
// dart: void showMessageWithArgs({Int value})
// kotlin: fun showMessageWithArgs(value: Int)
func showMessageWithArgs(value: Int) {
    print("hello world \(value)")
}

showMessageWithArgs(value: 0)


/*
 very interesting, return value works similar the way Kotlin uses the last line as a returning value found in lambdas
 we could had written, but is unusual
 func showMessageWithArgs(value: Int) -> Void {
 */
func basicFunction() -> Int {
    0
}

print("returned type \(basicFunction())")


func returnIf(value: Int) -> Bool {
    if(value > 0 ) {
        return true
    } else {
        return false
    }
}

print("returned type \(basicFunction())")


func greeting(message: String = "Hello World") {
    print("greeting -> \(message)");
}

greeting()

/**
 In Java/Kotlin/Dart is usual to return in a void method to avoid continuing
 */
func processTrack(trackName: String? = nil, artist: String? = nil, duration: Int? = nil) -> String {

    // these don't look like conditions, I don't get it why these assignments work
    // we can use guards even in loops, where we can continue, break with return, or throw an error
    guard let safeTrack = trackName, safeTrack != "Calibre 50", let safeArtist = artist, let safeDuration = duration else {
        return "one value is missing"
    }

    return "\(safeTrack) : \(safeArtist) : \(safeDuration)"
}

print(processTrack())
print(processTrack(trackName: "Rumores"))
print(processTrack(trackName: "Rumores", artist: "Joan Sebastian", duration: 180))
print(processTrack(trackName: "Calibre 50", artist: "Joan Sebastian", duration: 180))

/**
 Closure Expression Syntax

Closure expression syntax has the following general form:

    { (parameters) -> return type in
        statements
    }
**/

let funkyTown = { (a: String) -> String in
   "hello \(a)"
}

print(funkyTown("and go to Funky Town!"))

func handleTown(town: String, fun :(String) -> String) -> String {
    "handling {\(fun(town))}"
}

print(handleTown(town: "Funky Town", fun: funkyTown) );