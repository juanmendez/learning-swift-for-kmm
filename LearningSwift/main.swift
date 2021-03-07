// in Kotlin you need to tell a class can be inheritable with open
// here all classes are inheritable, unless you declare it with final
class Appliance {
    var manufacturer: String = ""
    var model: String = ""
    var voltage: Int = 0
    var capacity: Int?
    
    func getDetails() -> String {
        var message = "This is the \(model) from \(manufacturer)."

        if voltage == 220 {
            message += "This model is for European usage."
        }

        return message
    }
}

struct Message {
    var value: String
}

// same object reference
let appliance = Appliance()
let appliance2 = appliance
appliance2.manufacturer += "appliance2.update"
print("\(appliance.manufacturer) \(appliance2.manufacturer)")

// new reference is a new copy
let message = Message(value: "hello")
var message2 = message
message2.value += "update"

print("\(message.value) vs \(message2.value)")


// Inheritance
// in Java the base class of all classes is Object, not in Swift
class Toaster: Appliance {

    // how you can override init
    override init() {
        super.init()
    }
}

extension Appliance {
    func removeSpaces() -> String {
        getDetails()
    }
}

let spaces = appliance.removeSpaces()

class Player {

    private var secretLives: Int = 0
    var name: String


    /**
     Here is a getter/setter. Where as we can use field to store value
     in here we didn't have such choice but to use a private variable to do that.
      As always this makes no sense but is just for showing how it works in Swift
     */
    var livesRemaining: Int {
        set {
            print("livesRemaining new value \(newValue)")
            secretLives = newValue
        }

        get {
            print("livesRemaining getter \(secretLives)")
            return secretLives
        }
    }
    var enemiesDestroyed: Int
    var penalty: Int
    var bonus: Int {
        willSet {
            print("Bonus -> next value is \(newValue)")
        }

        didSet {
            print("Bonus <- value place \(oldValue)")
        }
    }

    // long
    /*var score: Int {
        get {
            let destroyed = enemiesDestroyed * 1000
            let lives = livesRemaining * 5000

            return destroyed + bonus + lives
        }
    }*/

    // short
    var score : Int {
        let destroyed = enemiesDestroyed * 1000
        let lives = livesRemaining * 5000

        return destroyed + bonus + lives
    }

    init(_ _name: String) {
        name = _name

        // interesting, within the class I couldn't do this assigment
        //livesRemaining = 3
        secretLives = 3
        enemiesDestroyed = 0
        penalty = 0
        bonus = 0
    }
}


let player = Player.init("Juan")
print("Juan's score \(player.score)")

// Cannot assign to property: 'score' is a get-only property
//player.score = 3


// on purpose we are using a getter and setter
//livesRemaining getter 3
//livesRemaining new value 6
player.livesRemaining += 3

// prints
// Bonus -> next value is 1
// Bonus <- value place 0
player.bonus = 1
