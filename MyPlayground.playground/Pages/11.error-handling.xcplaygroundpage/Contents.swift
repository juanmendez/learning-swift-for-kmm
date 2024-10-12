//: [Previous](@previous)

import Foundation

enum StringError: Error {
    case emptyString(_ message: String = "")
    case blankString
}

// we don't have to be explicit as Error must be the base class, but in other cases
// as the method below we can acknowledge what type it is.
func canThrowErrors(value: String) throws (any Error) -> String {
    defer {
        print("maintance work after throwing or completing function exception")
    }
    
    if value.isEmpty {
        throw StringError.emptyString("Empty string")
    } else if value.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
        throw StringError.blankString
    } else {
        return value.capitalized
    }
}

func throwWithGuard(_ value: String) throws (StringError) -> String {
    guard !value.isEmpty else {
        throw StringError.emptyString("Empty string")
    }
    
    return "good job \(value)"
}

// here we call and catch the error along with reading a message
do {
    try throwWithGuard("")
} catch StringError.emptyString(let message) {
    print("error produced \(message)")
} catch {
    print("unknown error!!")
}

/**
 You use try? to handle an error by converting it to an optional value. If an error is thrown while evaluating the try? expression, the value of the expression is nil.
 */
let error = try? throwWithGuard("")

if(error == nil) {
    print("shortcut to assign a default value in case of an exception")
}

let errorRescuer = (try? throwWithGuard("")) ?? "default value"
print("errorRescuer is \(errorRescuer)")

// notice this is a long way to do the same
let result: String?
do {
    result = try throwWithGuard("")
} catch {
    result = nil
}

if let safeValue = result {
    print("result is \(safeValue)")
} else {
    print("there is an error but we can't catch it")
}

/**
 do {
 try <#expression#>
 <#statements#>
 } catch <#pattern 1#> {
 <#statements#>
 } catch <#pattern 2#> where <#condition#> {
 <#statements#>
 } catch <#pattern 3#>, <#pattern 4#> where <#condition#> {
 <#statements#>
 } catch {
 <#statements#>
 }
 */
do {
    try print(canThrowErrors(value: ""))
} catch StringError.emptyString {
    print("string is empty to be capitalized")
} catch StringError.blankString {
    print("string is blank to be capitalized")
} catch {
    print("unexpected error: \(error)")
}

do {
    try print(canThrowErrors(value: "    "))
} catch StringError.emptyString {
    print("string is empty to be capitalized")
} catch StringError.blankString {
    print("string is blank to be capitalized")
} catch {
    print("unexpected error: \(error)")
}

do {
    try print(canThrowErrors(value: "hello"))
} catch StringError.emptyString {
    print("string is empty to be capitalized")
} catch StringError.blankString {
    print("string is blank to be capitalized")
} catch {
    print("unexpected error: \(error)")
}

// how to handle returning error instead of throwing it.

func dontThrowReturnError(_ value: String) -> Result<String, StringError> {
    do {
        try throwWithGuard(value)
    } catch StringError.emptyString(let message) {
        return .failure(StringError.emptyString(message))
    } catch {
        
    }
        
    return .success("great job!")
}
