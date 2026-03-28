//
//  InItSwift.swift
//  R&DProject
//
//  Created by ashish on 27/03/23.
//

import Foundation

 class A {
    var name: String
    
//    MARK: - Basic Initializer (Designated init)
    /*
    init() {
        name = "Bhupi"
        print_debug("Basic swift initializer \(name)")
    }
    */
//    MARK: - Designated init
   
    init(name: String) {
        self.name = name
    }
 
    //    MARK: - Failable init
 /*
    init?(name: String) {
        if name.isEmpty {
            print_debug("Name is not found ")
            return nil
        }
        self.name = name
    }
   */
    
//    MARK: - Convenience init
    
    convenience init() {
        self.init(name: "Bhoopendra")
    }
    
    
    /*
    required init() {
        print_debug("Hello")
    }
    */
}

class B {
//    let a = A(name: "Bhupi")
}
