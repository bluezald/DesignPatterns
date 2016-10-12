//
//  TemplateMethodPattern.swift
//  DesignPatterns
//
//  Created by Vincent Bacalso on 11/10/2016.
//  Copyright © 2016 bluezald. All rights reserved.
//

import UIKit

/**
 
 Intent:
 
 Define the skeleton of an algorithm in an operation, 
 deferring some steps to client subclasses. 
 Template Method lets subclasses redefine certain steps of an algorithm
 without changing the algorithm's structure.
 
 Base class declares algorithm 'placeholders', 
 and derived classes implement the placeholders.
 
 */

class TemplateMethodPattern: NSObject {

}

// This class provides the skeleton of the application
class Game {
    func initialize() {
        
    }
    
    func startPlay() {
        
    }
    
    func endPlay() {
        
    }
    
    final func  play() {
        
        self.initialize()
        
        self.startPlay()
        
        self.endPlay()
    }
    
    
}

class Football: Game {
    
    override func initialize() {
        print("Football Game Initialized: Starting Game")
    }
    
    override func startPlay() {
        print("Playing Game")
    }
    
    override func endPlay() {
        print("End Game")
    }
    
}

