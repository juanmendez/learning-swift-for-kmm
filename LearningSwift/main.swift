protocol Goofy {
    var hello: String { get }
    var name: String { get set }
    func sayMyName() -> String
}

class Player: CustomStringConvertible, Goofy {
    private var _name: String

    init(_ name: String) {
        _name = name
    }

    // this is part of CustomStringConvertible
    var description: String {
        "description \(_name)"
    }
    var hello: String {
        _name
    }
    var name: String {
        set {
            _name = newValue
        }

        get {
            _name
        }
    }

    func sayMyName() -> String {
        _name
    }
}

let player = Player("Juan")
print(player.description)

player.name = "Jose"
print(player.hello)
print(player.sayMyName())

protocol Toggle {
    // mutating is needed when overriding
    mutating func toggle()
}

enum SwitchEnum: Toggle {
    case on
    case off

    // Cannot assign to property: 'self' is immutable; unless, you make it a mutable function
    // and make sure protocol also address it
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

struct SwitchStruct: Toggle {
    var value: Bool

    // if nothing here was mutating, we could simply start with func even if the protocol addresses it
    mutating func toggle() {
        value = !value
    }
}


/**
 We can tell other references make a new copy. This is quite useful and also simpler than DataClass.copy() in Kotlin
 The only disadvantage is not being able to modify any properties like copy() does.
 */
var switchEnum = SwitchEnum.off
var copyOfSwitchEnum = switchEnum
switchEnum.toggle()
print("switchEnum \(switchEnum)")
print("copyOfSwitchEnum \(copyOfSwitchEnum)")

var switchStruct = SwitchStruct(value: true)
var copyOfSwitchStruct = switchStruct
switchStruct.toggle()
print("switchStruct.value \(switchStruct.value)")
print("copyOfSwitchStruct.value \(copyOfSwitchStruct.value)")
