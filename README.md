# Funky Functions

Regular functions:

```swift
// TypeReturned can be omitted if is a void function
func methodName(arg1: Type1, arg2: Type2 ) -> TypeReturned {
    
    valueReturned // no need to add return
}

// invocation
let valueReturned = methodName(arg1: Value1, arg2: Value2)

// invocation with warning since value returned is not used
methodName(arg1: Value1, arg2: Value2)
```

Functions with optional arguments

```swift
func methodName(arg1: Type1 = defaultValue ){
    
} 
```

Functions returning a closure which is known as lambda in Kotlin

```swift
func methodName(arg1: Type1) -> (Int) -> Void {
    // don't know yet how closures work
}
```

- Naming functions go along with argument names, so you read it as a whole phrase

```swift
type(of: someVariable) 
// not typeOf(value: someVariable)
```