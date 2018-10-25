//
//  ProxyPattern.swift
//  DesignPatterns
//
//  Created by Vincent Bacalso on 07/10/2016.
//  Copyright © 2016 bluezald. All rights reserved.
//

import UIKit

/**
 
 Intent:
 
 Provide a surrogate or placeholder for another object 
 to control access to it.
 
 Use an extra level of indirection to support distributed, 
 controlled, or intelligent access.
 
 Add a wrapper and delegation to protect the real component 
 from undue complexity.

 
 */

protocol IPlane {
    func takeOff()
}

class Plane: IPlane {
    internal func takeOff() {
        print("Taking Off...")
    }
}

class ProxyPlane: IPlane {
    
    private var driver: Driver
    private var realPlane: IPlane
    
    init(driver: Driver) {
        self.driver = driver
        self.realPlane = Plane()
    }
    
    internal func takeOff() {
        if driver.age <= 16 {
            print("Sorry this driver is too young to drive a plane")
        } else {
            self.realPlane.takeOff()
        }
    }
}

class Driver {
    var age: Int
    
    init(age: Int) {
        self.age = age
    }
}
