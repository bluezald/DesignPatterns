//: Playground - noun: a place where people can play

import UIKit

class MoneyPile {
    let value: Int
    let quantity: Int
    var nextPile: MoneyPile?
    
    init(value: Int, quantity: Int, nextPile: MoneyPile?) {
        self.value = value
        self.quantity = quantity
        self.nextPile = nextPile
    }
    
    func canWithdraw(valueToWithdraw: Int) -> Bool {
        var v = valueToWithdraw
        
        func canTakeSomeBill(want: Int) -> Bool {
            return (want / self.value) > 0 //if the "want" value is divisble to the value of the money pile
        }
        
        var q = self.quantity
        
        while canTakeSomeBill(want: v) {
            
            if q == 0 {
                break // break the chain if there's no longer a bill in the money pile (which is the q or quantity)
            }
            
            v -= self.value
            q -= 1
        }
        
        if v == 0 {
            return true
        } else if let next = self.nextPile {
            return next.canWithdraw(valueToWithdraw: v)
        }
        
        return false
    }
    
}

class ATM {
    private var hundreds: MoneyPile
    private var fiveHundreds: MoneyPile
    private var thousands: MoneyPile
    
    private var startPile: MoneyPile {
        return self.thousands
    }
    
    init(thousands: MoneyPile, fiveHundreds: MoneyPile, hundreds: MoneyPile) {
        self.thousands = thousands
        self.fiveHundreds = fiveHundreds
        self.hundreds = hundreds
    }
    
    func canWithdraw(value: Int) -> String {
        return "Can withdraw: \(self.startPile.canWithdraw(valueToWithdraw: value))"
    }
    
}

class ChainOfResponsibilityPattern: NSObject {
    
    func demo() {
        let hundreds = MoneyPile(value: 100, quantity: 10, nextPile: nil)
        let fiveHundreds = MoneyPile(value: 500, quantity: 10, nextPile: hundreds)
        let thousands = MoneyPile(value: 1000, quantity: 10, nextPile: fiveHundreds)
        
        let atm = ATM(thousands: thousands, fiveHundreds: fiveHundreds, hundreds: hundreds)
        atm.canWithdraw(value: 9800)
        
    }
}



// MARK: Builder Pattern

//class BuilderPattern: NSObject {
//    
//    public func demo() {
//        let aPizza = Pizza.Builder(size: 12)
//            .hasCheese(true)
//            .hasPepperoni(false)
//            .hasBacon(true)
//        print("Size: \(aPizza.size), hasCheese: \(aPizza.hasCheese), hasPepperoni: \(aPizza.hasPepperoni)")
//        
//    }
//}
//
//public class Pizza {
//    var size: Int!
//    var hasCheese: Bool?
//    var hasPepperoni: Bool?
//    var hasBacon: Bool?
//    
//    public class Builder {
//        fileprivate final var size: Int!
//        fileprivate var hasCheese: Bool?
//        fileprivate var hasPepperoni: Bool?
//        fileprivate var hasBacon: Bool?
//        
//        init(size: Int) {
//            self.size = size
//        }
//        
//        public func hasCheese(_ hasCheese: Bool) -> Builder {
//            self.hasCheese = hasCheese
//            return self
//        }
//        
//        public func hasPepperoni(_ hasPepperoni: Bool) -> Builder {
//            self.hasPepperoni = hasPepperoni
//            return self
//        }
//        
//        public func hasBacon(_ hasBacon: Bool) -> Builder {
//            self.hasBacon = hasBacon
//            return self
//        }
//        
//        public func build() -> Pizza {
//            return Pizza(builder: self)
//        }
//    }
//    
//    private init(builder: Builder) {
//        self.size = builder.size
//        self.hasCheese = builder.hasCheese
//        self.hasPepperoni = builder.hasPepperoni
//        self.hasBacon = builder.hasBacon
//    }
//    
//}
//
//let builderPattern = BuilderPattern()
//builderPattern.demo()
//
//// MARK: Singleton Pattern
//
//class MotherShip {
//    static let sharedInstance = MotherShip()
//    private init() {}
//    
//    func doSomething() {
//        print("Do Something")
//    }
//    
//}
//
//let mothership = MotherShip.sharedInstance
//mothership.doSomething()

// MARK: Chain of Responsibility Pattern

