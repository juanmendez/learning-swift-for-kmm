# Operators
- no automatic conversation, like dividing 2/5 will return an integer, not a double
- variables declared with no value assigned don't mean they have a default value like an empty string, or 0
- null safe types are available with the question mark
- nil is just a value definition similar to undefined in Javascript

```swift
if maybeNil == nil {
  print("not defined")
}
```

- **forced unwrapping**, when you assure an optional var is already being defined, you add exclamation to the end.
  
`var unwrappedInt = optionalInt!`

- how we can also work with viewing values in xcode
  <img width="839" alt="image" src="https://user-images.githubusercontent.com/3371622/105258879-4a7ab880-5b50-11eb-95d1-99525c3928b6.png">
