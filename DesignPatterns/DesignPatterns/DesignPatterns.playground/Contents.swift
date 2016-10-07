//: Playground - noun: a place where people can play

import UIKit

// MARK: Builder Pattern

class BuilderPattern: NSObject {
    
    public func demo() {
        let aPizza = Pizza.Builder(size: 12)
            .hasCheese(true)
            .hasPepperoni(false)
            .hasBacon(true)
        print("Size: \(aPizza.size), hasCheese: \(aPizza.hasCheese), hasPepperoni: \(aPizza.hasPepperoni)")
        
    }
}

public class Pizza {
    var size: Int!
    var hasCheese: Bool?
    var hasPepperoni: Bool?
    var hasBacon: Bool?
    
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

let builderPattern = BuilderPattern()
builderPattern.demo()

// MARK: Singleton Pattern

class MotherShip {
    static let sharedInstance = MotherShip()
    private init() {}
    
    func doSomething() {
        print("Do Something")
    }
    
}

let mothership = MotherShip.sharedInstance
mothership.doSomething()


