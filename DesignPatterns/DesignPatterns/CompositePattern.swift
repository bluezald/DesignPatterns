//
//  CompositePattern.swift
//  DesignPatterns
//
//  Created by Vincent Bacalso on 07/10/2016.
//  Copyright © 2016 bluezald. All rights reserved.
//

import UIKit

/**
 
 Intent:
 
 Compose objects into tree structures to represent whole-part hierarchies. 
 Composite lets clients treat individual objects and compositions 
 of objects uniformly.
 
 Recursive composition
 
 "Directories contain entries, each of which could be a directory."
 
 1-to-many "has a" up the "is a" hierarchy
 
 */

class CompositePattern: NSObject {

}

class Employee {
    private var name: String
    private var department: String
    private var salary: Int
    lazy private  var subordinates: [Employee] = [Employee]()
    
    init(name: String, department: String, salary: Int) {
        self.name = name
        self.department = department
        self.salary = salary
    }
    
    func add(employee: Employee) {
        self.subordinates.append(employee)
    }
    
    func remove(employee: Employee) {
        if let index = self.subordinates.index(where: {$0.name == employee.name}) {
            self.subordinates.remove(at: index)
        }
    }
    
    func getSubordinates() -> [Employee] {
        return self.subordinates
    }
    
    
    
    
}


