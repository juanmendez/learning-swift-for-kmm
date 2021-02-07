# Structs

They are a cheap version of Kotlin data classes.
You don't have clonable methods like the case of Kotlin's `copy()`

iOS developers don't even have an idea how cool Kotlin is in contrast with Swift.

This is allowed in Kotlin, but Swift can't do that

```swift
func copy(newTitle: String = self.title)
```

I had to do this instead

```swift
func copy(title: String? = nil) {
  let newTitle = title ?? self.title
}
```

Again, Kotlin makes life easier :)

Here is the formula for writing closures
```swift
    { (parameters) -> return type in
        statements
    }
```

# Dictionaries

I have a simple demo but here most of the stuff works similar to Kotlin. I didn't get to see if there is mutable vs immutable map.