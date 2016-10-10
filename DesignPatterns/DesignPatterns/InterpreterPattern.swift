//
//  InterpreterPattern.swift
//  DesignPatterns
//
//  Created by Vincent Bacalso on 10/10/2016.
//  Copyright © 2016 bluezald. All rights reserved.
//

import UIKit

/**
 
 Intent: 
 
 Map a domain to a language, the language to a grammar, and the grammar 
 to a hierarchical object-oriented design.
 
 Interpreter Pattern relies on Logical operator applied on Strings (which
 are your sentences and grammar)
 
 */

class InterpreterPattern: NSObject {

    class func getMaleExpression() -> Expression {
        let robert: Expression = TerminalExpression(data: "Robert")
        let john: Expression = TerminalExpression(data: "John")
        return OrExpression(expression1: robert, expression2: john)
    }
    
    class func getMarriedWomanExpression() -> Expression {
        let julie: Expression = TerminalExpression(data: "Julie")
        let married: Expression = TerminalExpression(data: "Married")
        return AndExpression(expression1: julie, expression2: married)
    }
    
    func demo() {
        let isMale = InterpreterPattern.getMaleExpression()
        let isMarriedWomen = InterpreterPattern.getMarriedWomanExpression()
        
        print("John is Male \(isMale.interpret(context: "John"))")
        print("Julie is a Married womam? \(isMarriedWomen.interpret(context: "Married Julie"))")
    }
    
}

protocol Expression {
    func interpret(context: String) -> Bool
}

class TerminalExpression: Expression {
    var data: String
    
    init(data: String) {
        self.data = data
    }
    
    internal func interpret(context: String) -> Bool {
        if context.contains(self.data) {
            return true
        }
        return false
    }
}

class OrExpression: Expression {
    private var expression1: Expression?
    private var expression2: Expression?
    
    init(expression1: Expression, expression2: Expression) {
        self.expression1 = expression1
        self.expression2 = expression2
    }
    
    internal func interpret(context: String) -> Bool {
        return (self.expression1?.interpret(context: context))! ||
            (self.expression2?.interpret(context: context))!
    }
    
}

class AndExpression: Expression {
    private var expression1: Expression?
    private var expression2: Expression?
    
    init(expression1: Expression, expression2: Expression) {
        self.expression1 = expression1
        self.expression2 = expression2
    }
    
    internal func interpret(context: String) -> Bool {
        return (self.expression1?.interpret(context: context))! &&
            (self.expression2?.interpret(context: context))!
    }
    
}
