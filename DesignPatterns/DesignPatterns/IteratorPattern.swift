//
//  IteratorPattern.swift
//  DesignPatterns
//
//  Created by Vincent Bacalso on 10/10/2016.
//  Copyright © 2016 bluezald. All rights reserved.
//

import UIKit

/**
 
 Intent
 
 Provide a way to access the elements of an aggregate object sequentially 
 without exposing its underlying representation.
 
 The C++ and Java standard library abstraction that makes it possible to 
 decouple collection classes and algorithms.
 
 Promote to "full object status" the traversal of a collection.
 
 Polymorphic traversal
 
 */

class IteratorPattern: NSObject {
    
    func demo() {
        let namesRepo = NameRepository()
        
        while namesRepo.hasNext() {
            if let name = namesRepo.next() {
                print(name)
            }
        }
    }

}

/**
struct TradingCardGameCollection<T> {
    let deck: [T]
}

extension TradingCardGameCollection: IteratorSequence {
    typealias Generator = AnyIterator<T>
    
    func generate() -> AnyIterator<T> {
        var i = 0
        return AnyIterator { i += 1; return i >= self.deck.count ? nil : self.deck[i] }
    }
    
}
 */

protocol Iterator {
    func hasNext() -> Bool
    func next() -> Any?
}

protocol Container {
    func getIterator() -> Iterator
}

public class NameRepository: Iterator {
    private var index = 0
    var names: [String] = ["Robert", "John", "Julie", "Lora"]
    
    internal func hasNext() -> Bool {
        if self.index < self.names.count {
            return true
        } else {
            return false
        }
    }
    
    internal func next() -> Any? {
        if self.hasNext() {
            self.index += 1
            return names[self.index]
        }
        return nil
    }
    
}

