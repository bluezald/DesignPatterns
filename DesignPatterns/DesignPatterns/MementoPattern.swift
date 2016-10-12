//
//  MementoPattern.swift
//  DesignPatterns
//
//  Created by Vincent Bacalso on 11/10/2016.
//  Copyright © 2016 bluezald. All rights reserved.
//

import UIKit

/**
 
 Intent
 
 Without violating encapsulation, capture and externalize an object's 
 internal state so that the object can be returned to this state later.
 
 A magic cookie that encapsulates a "check point" capability.
 
 Promote undo or rollback to full object status.

 3 Distinct Roles in Memento
 Originator - the object that knows how to save itself.
 Caretaker - the object that knows why and when the Originator needs to save 
 and restore itself.
 Memento - the lock box that is written and read by the Originator, 
 and shepherded by the Caretaker.
 
 */

class MementoPattern: NSObject {

    func demo() {
        let checkPoint = CheckPoint()
        checkPoint.addGameStateEntry(level: 0, weapon: "Fire Ball", points: 20)
        checkPoint.addGameStateEntry(level: 1, weapon: "Flood", points: 10)
        checkPoint.printCheckPoint()
        let memento = GameMemento(checkPoint: checkPoint)
        checkPoint.addGameStateEntry(level: 2, weapon: "Crusher", points: 30)
        checkPoint.addGameStateEntry(level: 4, weapon: "Flower", points: 30)
        checkPoint.printCheckPoint()
        
        checkPoint.applyMemento(memento: memento)
        checkPoint.printCheckPoint()
    }
    
}

protocol Memento {
    
}

protocol Originator {
    func createMemento() -> Memento
    func applyMemento(memento: Memento)
}

struct GameStateEntry {
    var level: Int
    var weapon: String
    var points: Int
}

class CheckPoint: Originator {
    var entries: [Int: GameStateEntry] = [:]
    var totalPoints: Int = 0
    var nextId: Int = 0
    
    func addGameStateEntry(level: Int, weapon: String, points: Int) {
        let entry = GameStateEntry(level: level, weapon: weapon, points: points)
        self.entries[self.nextId] = entry
        self.nextId = self.nextId + 1
        self.totalPoints = self.totalPoints + points
    }
    
    func createMemento() -> Memento {
        return GameMemento(checkPoint: self)
    }
    
    func applyMemento(memento: Memento) {
        guard let m = memento as? GameMemento else {
            return
        }
        m.apply(checkPoint: self)
    }
    
    func printCheckPoint() {
        print("Printing CheckPoint")
    }
    
    
}

struct GameMemento: Memento {
    private let entries: [Int: GameStateEntry]
    private let nextId: Int
    private let totalPoints: Int
    
    init(checkPoint: CheckPoint) {
        self.entries = checkPoint.entries
        self.nextId = checkPoint.nextId
        self.totalPoints = checkPoint.totalPoints
    }
    
    func apply(checkPoint: CheckPoint) {
        print("Restoring a game state to a checkpoint")
        checkPoint.nextId = nextId
        checkPoint.totalPoints = totalPoints
        checkPoint.entries = entries
    }
}



/**
 Example:
 History in Photoshop
 
 */
