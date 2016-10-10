//
//  IteratorPattern.swift
//  DesignPatterns
//
//  Created by Vincent Bacalso on 10/10/2016.
//  Copyright © 2016 bluezald. All rights reserved.
//

import UIKit

class IteratorPattern: NSObject {

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

class NameRepository: Container {
    var names: [String] = ["Robert", "John", "Julie", "Lora"]
    
    internal func getIterator() -> Iterator {
        return NameIterator()
    }
    
    private class NameIterator: Iterator {
        
        var index: Int
        
        init() {
            
        }
        
        internal func hasNext() -> Bool {
            
            
            
        }
        
        internal func next() -> Any? {
            <#code#>
        }
        
    }
    
}

