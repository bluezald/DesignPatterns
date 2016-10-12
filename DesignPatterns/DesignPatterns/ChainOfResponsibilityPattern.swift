//
//  ChainOfResponsibilityPattern.swift
//  DesignPatterns
//
//  Created by Vincent Bacalso on 10/10/2016.
//  Copyright © 2016 bluezald. All rights reserved.
//

import UIKit

/**
 
 Intent
 
 Avoid coupling the sender of a request to its receiver by giving more than 
 one object a chance to handle the request. Chain the receiving objects and 
 pass the request along the chain until an object handles it.
 
 Launch-and-leave requests with a single processing pipeline that contains 
 many possible handlers.
 
 An object-oriented linked list with recursive traversal.
 
 Avoid coupling the sender of a request to the receiver by giving more than
 one object a chance to handle the request
 
 Would I Use This Pattern?
 
 This pattern is recommended when either of the following scenarios 
 occur in your application:
 
 Multiple objects can handle a request and the handler doesn't 
 have to be a specific object
 
 A set of objects should be able to handle a request with the handler 
 determined at runtime
 
 A request not being handled is an acceptable outcome.
 
 
 */
class ChainOfResponsibilityPattern: NSObject {

    func demo() {
        let hundreds = MoneyPile(value: 100, quantity: 10, nextPile: nil)
        let fiveHundreds = MoneyPile(value: 500, quantity: 10, nextPile: hundreds)
        let thousands = MoneyPile(value: 1000, quantity: 10, nextPile: fiveHundreds)
        
        let atm = ATM(thousands: thousands, fiveHundreds: fiveHundreds, hundreds: hundreds)
        atm.canWithdraw(value: 9800)
        
    }
    
}

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

/**
 
 Examples:
 
 ATM
 Purchase Request - where it has to go from concerning approvers in a company
 
 */
