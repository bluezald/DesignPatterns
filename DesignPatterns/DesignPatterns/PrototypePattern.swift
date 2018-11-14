//
//  PrototypePattern.swift
//  DesignPatterns
//
//  Created by Vincent Bacalso on 06/10/2016.
//  Copyright © 2016 bluezald. All rights reserved.
//

import UIKit

/**
 
 Intent
 
 Specify the kinds of objects to create using a prototypical instance, 
 and create new objects by copying this prototype.
 
 Co-opt one instance of a class for use as a breeder of all future instances.
 
 The new operator considered harmful.
 
 */


class PrototypePattern: NSObject {

}


/// This is base on this tutorial:
/// https://medium.com/jeremy-codes/prototype-pattern-in-swift-1b50517d1075
/// The explanation or reason for Prototype pattern is:
/// If you think carefully this pattern is applied every time you use value types
/// in Swift (Arrays, Int, Bool, etc), because every time you assign the value
/// of an instance to another one a new copy is made with the same values.
/// The problem is with reference values (classes) that every time you assign
/// an instance to a new one both share its values and modifications to they.
/// https://stackoverflow.com/a/38772757/602995
protocol CloneableGame {
  func setupScore(teamA: Int, teamB: Int)
  func clone() -> CloneableGame
}

class BasketballGame: CloneableGame {
  
  init() { }
  
  init(basketballGame: BasketballGame) {
    // Setup here
  }
  
  func setupScore(teamA: Int, teamB: Int) {
    // More setup here, as we cannot customize via init here
  }
  
  func clone() -> CloneableGame {
    return BasketballGame(basketballGame: self)
  }
}
