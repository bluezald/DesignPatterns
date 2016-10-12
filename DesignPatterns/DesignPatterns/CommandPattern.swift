//
//  CommandPattern.swift
//  DesignPatterns
//
//  Created by Vincent Bacalso on 10/10/2016.
//  Copyright © 2016 bluezald. All rights reserved.
//

import UIKit

/**
 
 Intent
 
 Encapsulate a request as an object, thereby letting you parametrize 
 clients with different requests, queue or log requests,
 and support undoable operations.
 
 Promote "invocation of a method on an object" to full object status
 
 An object-oriented callback
 
 The Command Pattern allows requests to be encapsulated as objects, 
 thereby allowing clients to be paramterized with different requests
 
 */

class CommandPattern: NSObject {
    func demo() {
        let podBayDoors = "Pod Bay Doors"
        let doorModule = HAL9000DoorsOperations(doors:podBayDoors)
        
        print(doorModule.open())
        print(doorModule.close())
    }
}

protocol DoorCommand {
    func execute() -> String
}

class OpenCommand: DoorCommand {
    let doors: String
    
    required init(doors: String) {
        self.doors = doors
    }
    
    func execute() -> String {
        return "Opened \(doors)"
    }
    
}

class CloseCommand: DoorCommand {
    let doors: String
    
    required init(doors: String) {
        self.doors = doors
    }
    
    func execute() -> String {
        return "Closed \(doors)"
    }
    
}

class HAL9000DoorsOperations {
    let openCommand: DoorCommand
    let closeCommand: DoorCommand
    
    init(doors: String) {
        self.openCommand = OpenCommand(doors: doors)
        self.closeCommand = CloseCommand(doors: doors)
    }
    
    func close() -> String {
        return closeCommand.execute()
    }
    
    func open() -> String {
        return openCommand.execute()
    }
}


/**
 
 Examples:
 The 'check' at a Diner
 
 
 */
