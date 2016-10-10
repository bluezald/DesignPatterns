//
//  MediatorPattern.swift
//  DesignPatterns
//
//  Created by Vincent Bacalso on 10/10/2016.
//  Copyright © 2016 bluezald. All rights reserved.
//

import UIKit

/**
 
 Intent:
 
 Define an object that encapsulates how a set of objects interact. 
 Mediator promotes loose coupling by keeping objects from referring 
 to each other explicitly, and it lets you vary their interaction independently.
 
 Design an intermediary to decouple many peers.
 
 Promote the many-to-many relationships between interacting peers to 
 "full object status".
 
 */

class MediatorPattern: NSObject {

    func demo() {
        let messagesMediator = MessageMediator()
        let user0 = ConcreteColleague(name: "0", mediator: messagesMediator)
        let user1 = ConcreteColleague(name: "1", mediator: messagesMediator)
        messagesMediator.addColleague(colleague: user0)
        messagesMediator.addColleague(colleague: user1)
        user0.send(message: "Hello")
        
    }
    
}

protocol Mediator {
    func send(message: String, colleague: Colleague)
}

class Colleague {
    let name: String
    let mediator: Mediator
    
    init(name: String, mediator: Mediator) {
        self.name = name
        self.mediator = mediator
    }
    
    func send(message: String) {
        mediator.send(message: message, colleague: self)
    }
    
    func receive(message: String) {
        assert(false, "Method should be overriden")
    }
    
}

class MessageMediator: Mediator {
    private var colleagues: [Colleague] = []
    
    func addColleague(colleague: Colleague) {
        colleagues.append(colleague)
    }
    
    func send(message: String, colleague: Colleague) {
        for c in colleagues {
            if c !== colleague {
                c.receive(message: message)
            }
        }
    }
}

class ConcreteColleague: Colleague {
    override func receive(message: String) {
        print("Colleague \(name) received: \(message)")
    }
}
