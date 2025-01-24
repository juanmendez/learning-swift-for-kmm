//
//  Animal.swift
//  MyApp
//
//  Created by Mendez, Juan on 1/13/25.
//
protocol Animal {
    var name: String { get }
    var age: Int { get }
    var weight: Double { get }
    var region: String { get }
    func sayHello() -> String
}
