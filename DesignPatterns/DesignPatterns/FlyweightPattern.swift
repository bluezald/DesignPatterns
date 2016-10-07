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
