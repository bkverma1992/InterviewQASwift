//
//  ClassStruct.swift
//  R&DProject
//
//  Created by ashish on 27/03/23.
//

import Foundation

struct MyStruct {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class MyClass: NSObject {
   @objc dynamic var name: String
    init(name: String) {
        self.name = name
    }
}

