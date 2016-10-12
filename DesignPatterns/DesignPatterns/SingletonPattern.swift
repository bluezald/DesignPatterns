//
//  SingletonPattern.swift
//  DesignPatterns
//
//  Created by Vincent Bacalso on 06/10/2016.
//  Copyright © 2016 bluezald. All rights reserved.
//

import UIKit

/**
 Intent
 
 Ensure a class has only one instance, and provide a global point of 
 access to it.
 
 Encapsulated "just-in-time initialization" or "initialization on first use".
 
 */

class SingletonPattern: NSObject {

}

class MotherShip {
    static let sharedInstance = MotherShip()
    private init() {}
}


/**
 
 Examples:
 App Delegate
 
 */
