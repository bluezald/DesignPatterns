//
//  FlyweightPattern.swift
//  DesignPatterns
//
//  Created by Vincent Bacalso on 07/10/2016.
//  Copyright © 2016 bluezald. All rights reserved.
//

import UIKit

/**
 
 Intent
 
 Use sharing to support large numbers of fine-grained objects efficiently.
 
 The Motif GUI strategy of replacing heavy-weight widgets with light-weight
 gadgets.
 
 */

class FlyweightPattern: NSObject {

}

struct Flyweight {
    
    var companyName: String
    var companyLocation: String
    var companyWebsite: String

}

class FlyweightPointer {
    public static let company = Flyweight(companyName: "Abc", companyLocation: "XYZ", companyWebsite: "www.abc.com")
}

class MyObject {
    var name: String?
    var company: String {
        get {
            return FlyweightPointer.company.companyName
        }
    }
}

protocol Geometry {
    func draw()
}

class Circle2: Geometry {
    private var color: UIColor
    var x: Int
    var y: Int
    var radius: Int
    
    init(color: UIColor) {
      self.color = color
    }
    
    func draw() {
        print("Circle: Draw \(self.color) + x: \(self.x) + y: \(self.y) + radius: \(self.radius)")
    }
}

class GeometryFactory {
    static var circleMap: [UIColor : Circle2] = [UIColor: Circle2]()
    
    class func getCircle(color: UIColor) -> Geometry {
        if let circle = circleMap[color] {
            return circle
        } else {
            let circle = Circle2(color: color)
            circleMap.updateValue(circle, forKey: color)
            return circle
        }
        
    }
    
}












