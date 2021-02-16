# Chain of ifs

instead of nesting ifs, Swift has flattened multiple conditions.

```swift
if condition1 {
    if condition2 {
        if condition3 {
            print("do the work")
        }
    }
}

// can be treated as
if condition1, condition2, condition3 {
    print("do the work")
}
```

anytime there is a variable declared which is not being assigned nil, then that is a successful assignment

```swift
if let safeA = optionalA {
    print("we can assure safeA is not nil \(safeA)")
}
```

Therefore you can condition to multiple assignments 

```swift
if let a = optionalA, let b = optionalB, let c = Int("0") {
    print("a, b, c don't have any nil values")
} else {
    print("one variable or many are nil")
}
```


