//
//  StrategyPattern.swift
//  DesignPatterns
//
//  Created by Vincent Bacalso on 11/10/2016.
//  Copyright © 2016 bluezald. All rights reserved.
//

import UIKit

/**
 Intent: 
 
 Define a family of algorithms, encapsulate each one, and make them 
 interchangeable.
 Strategy lets the algorithm vary independently from the clients that use it.
 
 Capture the abstraction in an interface, bury implementation details in 
 derived classes.
 
 */

class StrategyPattern: NSObject {

    func demo() {
        let lower = Printer(strategy: LowerCaseStrategy())
        print(lower.printString(string: "John Wick Chapter 2"))
        
        let upper = Printer(strategy: UpperCaseStrategy())
        print(upper.printString(string: "John Wick Chapter 2"))
    }
    
}

protocol PrintStrategy {
    func printString(string: String) -> String
}

class Printer {
    let strategy: PrintStrategy
    
    init(strategy: PrintStrategy) {
        self.strategy = strategy
    }
    
    func printString(string: String) -> String {
        return self.strategy.printString(string: string)
    }
    
}

class UpperCaseStrategy: PrintStrategy {
    internal func printString(string: String) -> String {
        return string.uppercased()
    }
}

class LowerCaseStrategy: PrintStrategy {
    internal func printString(string: String) -> String {
        return string.lowercased()
    }
}

