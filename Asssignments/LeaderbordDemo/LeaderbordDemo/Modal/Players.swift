//
//  Players.swift
//  LeaderbordDemo
//
//  Created by APPLE on 01/08/25.
//

import Foundation

struct Player {
    let id: Int
    let name: String
    let score: Int
    var rank: Int = 0
    var prize: Int = 0 
    var isCurrentUser: Bool = false 
}
