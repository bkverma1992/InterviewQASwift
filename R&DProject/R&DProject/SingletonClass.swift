//
//  SingletonClass.swift
//  R&DProject
//
//  Created by ashish on 28/03/23.
//

import Foundation

class Singleton {
    static let shared = Singleton()
    init() {}
    func displayData() {
        print_debug("WE CREATE SINGLETON CLASS")
    }
}
