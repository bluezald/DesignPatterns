//
//  NullObjectPattern.swift
//  DesignPatterns
//
//  Created by Vincent Bacalso on 11/10/2016.
//  Copyright © 2016 bluezald. All rights reserved.
//

import UIKit

/**
 
 Intent:
 
 The intent of a Null Object is to encapsulate the absence of an object by 
 providing a substitutable alternative that offers suitable default do nothing 
 behavior. In short, a design where "nothing will come of nothing"
 
 Use the Null Object pattern when
 
 an object requires a collaborator. The Null Object pattern does not 
 introduce this collaboration--it makes use of a collaboration 
 that already exists
 
 some collaborator instances should do nothing
 
 you want to abstract the handling of null away from the client
 
 */

class NullObjectPattern: NSObject {

}

protocol Animal {
    func makeSound()
}

class Dog: Animal {
    internal func makeSound() {
        print("Woof!")
    }
}

class NullAnimal: Animal {
    internal func makeSound() {
        // Do Nothing
    }
}

/**
 Reasons of Usage:
 
 Removing old functionality
 The Null Object can be used to remove old functionality by replacing it with 
 null objects. The big advantage is that the existing code doesn't need 
 to be touched.
 
 */
