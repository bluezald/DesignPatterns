//
//  StatePattern.swift
//  DesignPatterns
//
//  Created by Vincent Bacalso on 11/10/2016.
//  Copyright © 2016 bluezald. All rights reserved.
//

import UIKit

/**
 
 Intent:
 
 Allow an object to alter its behavior when its internal state changes. 
 The object will appear to change its class.
 
 An object-oriented state machine
 
 wrapper + polymorphic wrappee + collaboration
 
 */

class StatePattern: NSObject {

}

class Context {
//    private var state: State = 
}

protocol State {
    func isAuthorized(context: Context) -> Bool
    func userId(context: Context) -> String?
}

class UnauthorizedState: State {
    internal func userId(context: Context) -> String? {
        return nil
    }

    internal func isAuthorized(context: Context) -> Bool {
        return false
    }
}

class AuthorizedState: State {
    let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    internal func isAuthorized(context: Context) -> Bool {
        return true
    }
    
    internal func userId(context: Context) -> String? {
        return self.userId
    }
    
}
