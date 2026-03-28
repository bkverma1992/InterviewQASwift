//
//  AccessController.swift
//  R&DProject
//
//  Created by ashish on 15/02/23.
//

import Foundation

//class Teacher {
//  fileprivate let teacherRoll = 234
//  fileprivate let age = 40
//    
//    func teacherData() -> Int {
//        return teacherRoll + age
//    }
//}
//
//class Student {
//    var teacherClass = Teacher()
//    func printData() {
//        teacherClass.teacherData()
//        teacherClass.age + teacherClass.teacherRoll
//    }
//}

class Utitlity {
    public static var instance = Utitlity()
    var sdkKey: String? = nil
    
    func addToNumbers(first:Int, second:Int) -> Int {
        return first + second
    }
}
