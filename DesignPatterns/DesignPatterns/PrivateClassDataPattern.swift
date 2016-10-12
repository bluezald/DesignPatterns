//
//  PrivateClassDataPattern.swift
//  DesignPatterns
//
//  Created by Vincent Bacalso on 07/10/2016.
//  Copyright © 2016 bluezald. All rights reserved.
//

import UIKit

/**
 
 Intent:
 
 Control write access to class attributes
 Separate data from methods that use it
 Encapsulate class data initialization
 Providing new type of final - final after constructor
 
 */

// Reduce exposure of attributes by limiting their visibility
class PrivateClassDataPattern: NSObject {

}

class PrivateClassDataPatternCircle {
    private var radius: Double
    private var color: UIColor
    private var origin: CGPoint
    
    init(radius: Double, color: UIColor, origin: CGPoint) {
        self.radius = radius
        self.color = color
        self.origin = origin
    }
    
    public var circumference: Double {
        get {
            return 2 * Double.pi * self.radius
        }
    }
    
    public var diameter: Double {
        get {
            return 2 * self.radius
        }
    }
    
}

