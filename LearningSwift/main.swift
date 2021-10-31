//
// Created by Juan Mendez on 9/9/21.
// Copyright (c) 2021 Juan Mendez. All rights reserved.
//

import Foundation

let player = Player("Juan")
print(player.description)

player.name = "Jose"
print(player.hello)
print(player.sayMyName())

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