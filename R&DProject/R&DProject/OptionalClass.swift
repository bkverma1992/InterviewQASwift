//
//  OptionalClass.swift
//  R&DProject
//
//  Created by ashish on 26/02/23.
//

import Foundation


struct Person {
    let firstName: String
    let middleName: String? // Optional declaration 
    let lastName: String?
    let address: Address?
    
    init(firstName: String, middleName: String?, lastname: String?, address: Address?) {
        self.firstName = firstName
        self.middleName = middleName
        self.lastName = lastname
        self.address = address
    }
}

struct Address {
    let street: String?
    let state: String?
    let city: String?
    let zipCode: Int?
    
    init(street: String?, state: String?, city: String?, zipCode: Int?) {
        self.street = street
        self.state = state
        self.city = city
        self.zipCode = zipCode
    }
}

/*
 func optionalAndTypes() {
     let address = Address(street: "SBD", state: "UP", city: "Agra", zipCode: 283125)
     optional = Person(firstName: "Bhupi", middleName: "K", lastname: "Verma", address: address)
     // There are four type unwrapping the optional value
     //         1. Force unwrapping
     print_debug("Force unwrapping == \(optional?.middleName!)")
     
     //        2. Nil Coalescing
     print_debug("Nil Coalescing === \(optional?.lastName ?? "Verma")")
     
     //        3.a Optional Binding (if let)
     
     if let lstName = optional?.lastName {
         print_debug("Optional Binding with use if let === \(lstName)")
     }
     
     //        3.b Optional Binding (guard let)
     guard let lastName = optional?.lastName else { return }
     print_debug("Optional Binding with use guard let === \(lastName)")
     
     if let address = optional?.address {
         if let state = address.state {
             print_debug("if let optinal binding == \(state)")
         }
     }
     
     //        Optional Chaning
     if let city = optional?.address?.city {
         print_debug("Optional Chaining === \(city)")
     }
 }
 */

//class person {
//    let user:String?
//    
//}
class Person1 {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}

