//
//  ServiceModel.swift
//  ZuperAssesment
//
//  Created by APPLE on 19/12/25.
//

import Foundation
import SwiftUI

// MARK: - Status Enum for Services
enum ServiceStatus: String, CaseIterable {
    case planned = "Planned"
    case scheduled = "Scheduled"
    case confirmed = "Confirmed"
    case approved = "Approved"
    
    var color: Color {
        switch self {
        case .planned:
            return .blue
        case .scheduled:
            return .green
        case .confirmed:
            return .mint
        case .approved:
            return .orange
        }
    }
}

struct Service: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let customer: String
    let description: String
    let status: ServiceStatus
    let time: String
    let location: String
    let notes: String
    let lat: String
    let lon: String
}
