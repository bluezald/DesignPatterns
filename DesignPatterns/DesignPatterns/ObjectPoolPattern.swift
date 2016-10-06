//
//  ObjectPoolPattern.swift
//  DesignPatterns
//
//  Created by Vincent Bacalso on 05/10/2016.
//  Copyright © 2016 bluezald. All rights reserved.
//

import UIKit

/**
 Intent
 
 Object pooling can offer a significant performance boost; 
 it is most effective in situations where the cost of initializing 
 a class instance is high, the rate of instantiation of a class is high, 
 and the number of instantiations in use at any one time is low.
 
 The Factory Method pattern can be used to encapsulate the creation logic 
 for objects. However, it does not manage them after their creation, 
 the object pool pattern keeps track of the objects it creates.
 
 Object Pools are usually implemented as Singletons.
 
 */
class ObjectPoolPattern: NSObject {

    public func demo() {
        let pool = Pool()
        let iNeedAPoolObject = pool.getObject()
        print(iNeedAPoolObject)
    }
    
}

class PooledObject {
    let name: String
    let serialNumber: Int
    
    init(name: String, serialNumber: Int) {
        self.name = name
        self.serialNumber = serialNumber
    }
}

class Pool {
    
    private var available = Array<PooledObject>()
    private var inUse = Array<PooledObject>()
    
    internal func getObject() -> PooledObject {
        if available.count > 0 {
            let object = available[0]
            inUse.append(object)
            available.remove(at: 0)
            return object
        } else {
            let object = PooledObject(name: "Default Name", serialNumber: 0)
            inUse.append(object)
            return object
        }
    }
    
    internal func release(object: PooledObject) {
        available.append(object)
        if let index = inUse.index(where: {$0.name == object.name}) {
            inUse.remove(at: index)
        }
        
    }
    
    
}

/**
 
 Examples:
 Office Warehouse
 TableView Cells
 Database Connections
 
 */
