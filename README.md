# Protocol

In Swift protocols are more emphasized than classes. This is the base of how protocols in the iOS world have rich documentation. 
Así es como estos cabrones de Apple no permiten que uno vea la fuente del código.

What we have and is also found in Kotlin

- declare getters / setters
- also base class goes first and then protocols `class MyClass : BaseClass, Protocol0, Protocol1`
- Structs and Enums make new copies by just being assigned to other variables. This is quite simple, but if we need to
  emulate Kotlin's `DataClass.copy(att0=0, att1=1)` we could use a `mutating function` to update values.