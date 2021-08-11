/**
 to understand description check
 https://stackoverflow.com/a/36587136/2184088
 */
class Adventurer: CustomStringConvertible {
    // key modifier is internal by default, so it can be accessed within file
    // use private just like in Kotlin or Java. Dart uses underscore prefix
    // also use public like those other languages. Dart key modifier is public by default
    private let name: String
    var maxHealth: Int
    var specialMove: String?

    // Kotlin can declare a constructor inlined with class declaration
    init(name: String, maxHealth: Int) {
        self.name = name
        self.maxHealth = maxHealth
    }

    // getter/setter in Swift
    var healthLost: Int {
        /**
         if you don't need a setter then simply
          return what's in get without its clause
         */
        get {
            maxHealth - 50
        }
        set {
            maxHealth = newValue
        }
    }

    /** getter/setter in Kotlin
        var stringRepresentation: String
        get() = maxHealth - 50
         set(newValue) {
            maxHealth = newValue
        }
     */


    /// if Kotlin uses companion object, and java uses static methods and vars
    /// Swift uses internal classes to achieve the same
    class var credo: String {
        "Life is right here, right now"
    }


    private static var _message: String?

    /// so message works similar to getter/setter healthLost
    class var message: String? {
        get {
            _message
        }
        set {
            _message = newValue
        }
    }

    // they work similarly to factories in Dart
    convenience init(name: String) {
        self.init(name: name, maxHealth: 100)
    }

    // they work similarly to factories in Dart
    convenience init(maxHealth: Int) {
        self.init(name: "", maxHealth: maxHealth)
    }

    var description: String {
        "Adventurer name: \(name) max-health: \(maxHealth)"
    }
}

class Ranger: Adventurer {
    var classAdvantage: String

    init(name: String, maxHealth: Int, classAdvantage: String) {
        self.classAdvantage = classAdvantage
        super.init(name: name, maxHealth: maxHealth)
    }

    convenience init(advantage: String) {
        self.init(name: "", maxHealth: 100, classAdvantage: advantage)
    }

    override var description: String {
        "\(super.description), ranger: \(classAdvantage)"
    }
}

let ranger = Ranger.init(advantage: "Advantage")
print(ranger)