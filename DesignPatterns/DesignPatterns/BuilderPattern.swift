//
//  BuilderPattern.swift
//  DesignPatterns
//
//  Created by Vincent Bacalso on 05/10/2016.
//  Copyright © 2016 bluezald. All rights reserved.
//

/**
 The builder pattern is a good choice when designing classes whose constructors
 or static factorieswould have more than a handful of parameters
 
 Problems Encountered, Why the use of Builder Pattern:
 Too many parameters on Telescoping Constructor Pattern, although this pattern
 is solved with Javabean Pattern: http://stackoverflow.com/a/1953567/602995
 
 */
import UIKit


/**
 Intent
 
 Separate the construction of a complex object from its representation 
 so that the same construction process can create different representations.
 Parse a complex representation, create one of several targets.
 */

// The Builder pattern separates the construction of a complex object
// from its representation so that the same construction process can create 
// different representations.

class BuilderPattern: NSObject {
    
    public func demo() {
        let aPizza = Pizza.Builder(size: 12)
            .hasCheese(true)
            .hasPepperoni(false)
            .hasBacon(true).build()
        print(aPizza)

    }
}

public class Pizza {
    private var size: Int!
    private var hasCheese: Bool?
    private var hasPepperoni: Bool?
    private var hasBacon: Bool?
    
    public class Builder {
        fileprivate final var size: Int!
        fileprivate var hasCheese: Bool?
        fileprivate var hasPepperoni: Bool?
        fileprivate var hasBacon: Bool?
        
        init(size: Int) {
            self.size = size
        }
        
        public func hasCheese(_ hasCheese: Bool) -> Builder {
            self.hasCheese = hasCheese
            return self
        }
        
        public func hasPepperoni(_ hasPepperoni: Bool) -> Builder {
            self.hasPepperoni = hasPepperoni
            return self
        }
        
        public func hasBacon(_ hasBacon: Bool) -> Builder {
            self.hasBacon = hasBacon
            return self
        }
        
        public func build() -> Pizza {
            return Pizza(builder: self)
        }
    }
    
    private init(builder: Builder) {
        self.size = builder.size
        self.hasCheese = builder.hasCheese
        self.hasPepperoni = builder.hasPepperoni
        self.hasBacon = builder.hasBacon
    }
    
}

/**
 Common Usage or Examples:
 1. In a Restaurant - The Creation of Pizza or Meal
 
 */
