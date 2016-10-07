
//
//  FacadePattern.swift
//  DesignPatterns
//
//  Created by Vincent Bacalso on 07/10/2016.
//  Copyright © 2016 bluezald. All rights reserved.
//

import UIKit

/**
 
 Intent
 
 Provide a unified interface to a set of interfaces in a subsystem. 
 Facade defines a higher-level interface that makes the subsystem easier to use.
 
 Wrap a complicated subsystem with a simpler interface.
 
 */

// The facade pattern is used to define a simplified interface 
// to a more complex subsystem.
class FacadePattern: NSObject {

}

class SubsystemA {
    
    func operation1() {
        print("Do Something: Operation 1 in Subsystem A")
    }
    
    func operation2() {
        print("Do Something: Operation 2 in Subsystem A")
    }
    
}

class SubsystemB {
    
    func operation1() {
        print("Do Something: Operation 1 in Subsystem B")
    }
    
    func operation2() {
        print("Do Something: Operation 2 in Subsystem B")
    }
    
}

class SubsystemC {
    
    func operation1() {
        print("Do Something: Operation 1 in Subsystem C")
    }
    
    func operation2() {
        print("Do Something: Operation 2 in Subsystem C")
    }
    
}

// MARK: Facade Here

class Facade {
    
    private let a: SubsystemA = SubsystemA()
    private let b: SubsystemB = SubsystemB()
    private let c: SubsystemC = SubsystemC()
    
    func operation1() {
        a.operation1()
        b.operation1()
        c.operation1()
    }
    
    func operation2() {
        a.operation2()
        b.operation2()
        c.operation2()
    }
    
}


