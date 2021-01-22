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