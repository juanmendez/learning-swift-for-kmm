typealias ThreeTuple = (
    name: String, damage: Int, rechargeable: Bool
)

let myThreeTuple: ThreeTuple = (
    name: "Juan", damage: 3, rechargeable: true
)

typealias HandleFunc = (String) -> Void

let myFunction: HandleFunc = { (test: String) -> Void in }