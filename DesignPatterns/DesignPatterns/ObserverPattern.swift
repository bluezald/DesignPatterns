//
//  ObserverPattern.swift
//  DesignPatterns
//
//  Created by Vincent Bacalso on 11/10/2016.
//  Copyright © 2016 bluezald. All rights reserved.
//

import UIKit

/**
 
 Intent
 
 Define a one-to-many dependency between objects so that when one object 
 changes state, all its dependents are notified and updated automatically.
 
 Encapsulate the core (or common or engine) components in a Subject abstraction, 
 and the variable (or optional or user interface) components in 
 an Observer hierarchy.
 
 The "View" part of Model-View-Controller.
 
 */

class ObserverPattern: NSObject {

}

protocol Observer {
    func update(subject: Subject)
}

protocol Subject {
    func attach(observer: Observer)
    func detach(observer: Observer)
    func notify()
}

class PatternObserver: Observer {
    
    init() {
        
    }
    
    internal func update(subject: Subject) {
        
    }
    
}

class PatternSubject: Subject {
    lazy private var observers: [Observer] = [Observer]()
    
    internal func attach(observer: Observer) {
        self.observers.append(observer)
    }
    
    internal func detach(observer: Observer) {
        // Detach here
    }
    
    internal func notify() {
        for observer in self.observers {
            observer.update(subject: self)
        }
    }
    
}



/**
 Examples:
 Auction - Bidding
 Swift didSet properties
 Notification Center
 
 */
