//
//  VisitorPattern.swift
//  DesignPatterns
//
//  Created by Vincent Bacalso on 11/10/2016.
//  Copyright © 2016 bluezald. All rights reserved.
//

import UIKit

/**
 
 Intent
 
 Represent an operation to be performed on the elements of an object structure. 
 Visitor lets you define a new operation without changing the classes 
 of the elements on which it operates.
 
 The classic technique for recovering lost type information.
 
 Do the right thing based on the type of two objects.
 
 Double dispatch
 
 */

class VisitorPattern: NSObject {
    func demo() {
        // Usage:
        
        let planets: [Planet] = [Alderaan(), Coruscant(), Tatooine()]
        _ = planets.map { (planet: Planet) -> String in
            let visitor = NameVisitor()
            planet.accept(visitor: visitor)
            return visitor.name
        }
        
    
    }
}

protocol PlanetVisitor {
    func visit(planet: Alderaan)
    func visit(planet: Coruscant)
    func visit(planet: Tatooine)
}

protocol Planet {
    func accept(visitor: PlanetVisitor)
}

class Alderaan: Planet {
    internal func accept(visitor: PlanetVisitor) {
        visitor.visit(planet: self)
    }
}

class Coruscant: Planet {
    internal func accept(visitor: PlanetVisitor) {
        visitor.visit(planet: self)
    }
}

class Tatooine: Planet {
    internal func accept(visitor: PlanetVisitor) {
        visitor.visit(planet: self)
    }
}

// Basically collating different classes and packing into 1 Class

class NameVisitor: PlanetVisitor {
    var name = ""
    
    func visit(planet: Alderaan) {
        name = "Alderaan"
    }
    
    func visit(planet: Coruscant) {
        name = "Coruscant"
    }
    
    func visit(planet: Tatooine) {
        name = "Tatooine"
    }
    
}

protocol EmployeeVisitor {
    func visit(employee: HourlyEmployee)
    func visit(employee: SalariedEmployee)
}

protocol Employee2 {
    func accept(visitor: EmployeeVisitor)
}

class HourlyEmployee: Employee2 {
    internal func accept(visitor: EmployeeVisitor) {
        
    }
}

class SalariedEmployee: Employee2 {
    internal func accept(visitor: EmployeeVisitor) {
        
    }
}


/**
 Example:
 Public-API
 */
