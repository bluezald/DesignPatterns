//
//  BridgePattern.swift
//  DesignPatterns
//
//  Created by Vincent Bacalso on 07/10/2016.
//  Copyright © 2016 bluezald. All rights reserved.
//

import UIKit

/**
 Intent:
 
 Decouple an abstraction from its implementation so that the two can 
 vary independently.
 
 Publish interface in an inheritance hierarchy, and bury implementation 
 in its own inheritance hierarchy.
 
 Beyond encapsulation, to insulation
 
 */

// Solves the problem of explosive inheritance
// Design mechanism that encapsulates an implementation class inside 
// of an interface class
class BridgePattern: NSObject {
    
}

protocol DrawAPI {
    func drawCircle(radius: Int, x: Int, y: Int)
}

class RedCircle: DrawAPI {
    func drawCircle(radius: Int, x: Int, y: Int) {
        print("Drawing Red Circle, radius, x, y: \(radius, x, y)")
    }
}

class GreenCircle: DrawAPI {
    func drawCircle(radius: Int, x: Int, y: Int) {
        print("Drawing Green Circle, radius, x, y: \(radius, x, y)")
    }
}

protocol Shape {
    var drawAPI: DrawAPI? { get set }
    func draw()
}

class Circle: Shape {
    internal var drawAPI: DrawAPI?

    private var x: Int?
    private var y: Int?
    private var radius: Int?
    
    init(x: Int, y: Int, radius: Int, drawAPI: DrawAPI) {
        self.drawAPI = drawAPI
        self.x = x
        self.y = y
        self.radius = radius
    }
    
    internal func draw() {
        self.drawAPI?.drawCircle(radius: self.radius!, x: self.x!, y: self.y!)
    }
}

// Another Example:

protocol Switch {
    var appliance: Appliance { get set }
    func turnOn()
}

protocol Appliance {
    func run()
}

class RemoteControl: Switch {
    var appliance: Appliance
    
    init(appliance: Appliance) {
        self.appliance = appliance
    }
    
    internal func turnOn() {
        self.appliance.run()
    }
}

class TV: Appliance {
    internal func run() {
        print("TV turned on and running")
    }
}

class VacuumCleaner: Appliance {
    internal func run() {
        print("Vacuum Cleaner turned on and running")
    }
}

class WashingMachine: Appliance {
    internal func run() {
        print("Washing Machine turned on and running")
    }
}


