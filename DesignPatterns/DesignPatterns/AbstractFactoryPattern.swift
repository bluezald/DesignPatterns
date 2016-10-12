//
//  AbstractFactoryPattern.swift
//  DesignPatterns
//
//  Created by Vincent Bacalso on 06/10/2016.
//  Copyright © 2016 bluezald. All rights reserved.
//

import UIKit

/**
 Intent:
 
 Provide an interface for creating families of related or 
 dependent objects without specifying their concrete classes.
 
 A hierarchy that encapsulates: many possible "platforms", 
 and the construction of a suite of "products".
 
 The new operator considered harmful.
 
 
 The purpose is to provide an interface for creating families of 
 related objects, without specifying concrete classes
 
 */

class AbstractFactoryPattern: NSObject {

}

protocol IButton {
    func paint()
}

protocol IGUIFactory {
    func createButton() -> IButton
}

// MARK: Windows GUI

class WindowButton: IButton {
    func paint() {
        print("Window Button")
    }
}

class WindowFactory: IGUIFactory {
    
    func createButton() -> IButton {
        return WindowButton()
    }
}

// MARK: OSX GUI

class OSXFactory: IGUIFactory {
    
    func createButton() -> IButton {
        return OSXButton()
    }
    
}

class OSXButton: IButton {
    func paint() {
        print("OSX Button")
    }
}

/**
 
 Examples:
 
 Factory of Cars
 
 */
