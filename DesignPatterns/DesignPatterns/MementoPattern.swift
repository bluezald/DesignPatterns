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

typealias Memento = Dictionary<NSObject, AnyObject>

let DPMementoKeyChapter = "com.valve.halflife.chapter"
let DPMementoKeyWeapon = "com.valve.halflife.weapon"
let DPMementoGameState = "com.valve.halflife.state"

class MementoPattern: NSObject {

    func demo() {
        
    }
    
}

class GameState {
//    var chapter: String = ""
//    var weapon: String = ""
//    
//    func toMemento() -> Memento {
//        return [ DPMementoKeyChapter as NSObject:chapter as AnyObject, DPMementoKeyWeapon:weapon ]
//    }
//    
//    func restoreFromMemento(memento: Memento) {
//        chapter = memento[DPMementoKeyChapter] as? String ?? "n/a"
//        weapon = memento[DPMementoKeyWeapon] as? String ?? "n/a"
//    }
//}
//
//enum CheckPoint {
//    static func saveState(memento: Memento, keyName: String = DPMementoGameState) {
//        let defaults = UserDefaults.standard
//        defaults.setObject(memento, forKey: keyName)
//        defaults.synchronize()
//    }
//    
//    static func restorePreviousState(keyName: String = DPMementoGameState) -> Memento {
//        let defaults = UserDefaults.standard
//        
//        return defaults.objectForKey(keyName) as? Memento ?? Memento()
//    }
}
