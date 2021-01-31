enum  Tacos {
    // you can break them into separate lines prefixed with case, and no comma at the end
    case CORN_TORTILLAS, FLOWER_TORTILLAS, HARD_SHELL, FLAUTA
}

let myTacoType = Tacos.FLAUTA

// with raw type
enum Burrito: String {
    case king = "King"
    case regular = "Regular"
    case bowl = "Bowl"
}

let myOwnKindBurrito = Burrito.bowl

print("type \(myOwnKindBurrito)")
print("value \(myOwnKindBurrito.rawValue)")
