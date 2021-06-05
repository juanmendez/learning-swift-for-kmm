// Swift Turples save multiple values in one variable
let upperCutAttack: (String, Int, Bool) = ("String", 1, true)
print(upperCutAttack.0)
print(upperCutAttack.1)
print(upperCutAttack.2)


//name your "keys"
let (attack, damage, rechargeable) = ("String", 1, true)
print(attack)
print(damage)
print(rechargeable)

// associate those "keys" into a variable
let lowerAttack: (attack: String, damage: Int, rechargeable: Bool) = ("String", 1, true)
print(lowerAttack.attack)
print(lowerAttack.damage)
print(lowerAttack.rechargeable)

