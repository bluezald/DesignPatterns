//
//  DecoratorPattern.swift
//  DesignPatterns
//
//  Created by Vincent Bacalso on 07/10/2016.
//  Copyright © 2016 bluezald. All rights reserved.
//

import UIKit

/**
 
 Intent
 
 Attach additional responsibilities to an object dynamically. 
 Decorators provide a flexible alternative to subclassing 
 for extending functionality.
 
 Client-specified embellishment of a core object by recursively wrapping it.
 
 Wrapping a gift, putting it in a box, and wrapping the box.
 
 */

class DecoratorPattern: NSObject {

}

protocol Coffee {
    func getCost() -> Double
    func getIngredients() -> String
}

class SimpleCoffee: Coffee {
    func getCost() -> Double {
        return 1.0
    }
    
    func getIngredients() -> String {
        return "Coffee"
    }
}

class CoffeeDecorator: Coffee {
    private let decoratedCoffee: Coffee
    internal let ingredientSeparator: String = ", "
    
    required init(decoratedCoffee: Coffee) {
        self.decoratedCoffee = decoratedCoffee
    }
    
    internal func getCost() -> Double {
        return decoratedCoffee.getCost()
    }
    
    internal func getIngredients() -> String {
        return decoratedCoffee.getIngredients()
    }
}

class Milk : CoffeeDecorator {
    
    required init(decoratedCoffee: Coffee) {
        super.init(decoratedCoffee: decoratedCoffee)
    }
    
    override func getCost() -> Double {
        return super.getCost() + 0.5
    }
    
    override func getIngredients() -> String {
        return super.getIngredients() + ingredientSeparator + "Milk"
    }
}
