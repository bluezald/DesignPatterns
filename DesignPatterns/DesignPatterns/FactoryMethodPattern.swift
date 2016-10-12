//
//  FactoryMethodPattern.swift
//  DesignPatterns
//
//  Created by Vincent Bacalso on 05/10/2016.
//  Copyright © 2016 bluezald. All rights reserved.
//

import UIKit

/**
 
 Intent
 
 Define an interface for creating an object, 
 but let subclasses decide which class to instantiate. 
 Factory Method lets a class defer instantiation to subclasses.
 
 Defining a "virtual" constructor.
 
 The new operator considered harmful.
 
 */

class FactoryMethodPattern: NSObject {

    public func demo() {
        
        let factory = SedanFactory()
        let car = factory.makeCar()
        print(car)
    }
    
}

protocol CarFactory: class {
    func makeCar() -> Sedan
}

protocol Car: class {
    func getType() -> String
}

class SedanFactory: CarFactory {
    
    internal func makeCar() -> Sedan {
        return Sedan()
    }
    
}

class Sedan: Car {

    internal func getType() -> String {
        return "Sedan"
    }

}

/**
 Examples:
 
 */
