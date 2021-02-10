# Arc

ARC: Automatic Reference Counting.
It checks for unused resources, it drops them out of the scope.
That's when calls deinit() in a given class

# Structs vs Classes
- You can transform easily a struct into a class
- Classes have init/deinit handlers, Structs don't
- Classes have inheritance, Structs don't
- Struct uses value types, so any new assignment makes a copy of the same instance
- Classes use reference types, so any new assignment has a reference to the same instance

I was at first disappointed with Structs, but now I can see it is simpler to make a copy by simply making a new assignment.
I still don't see any new copy with changes in one line like Kotlin's data classes.

# Swift Classes vs Kotlin Classes
- In Kotlin the base class is Any, Swift doesn't have a default super inheritance
- Whereas Kotlin uses inline constructors which allow to call parent class constructor, Swift requires overriding `init()`
- we define getter/setter variables in Kotlin, and Swift does the same with a different syntax.
  - Swift doesn't have `field` which is an internal variable for a getter/setter. Instead we can use a separate variable