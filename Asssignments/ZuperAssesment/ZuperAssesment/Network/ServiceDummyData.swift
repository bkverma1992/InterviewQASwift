//
//  ServiceDummyData.swift
//  ZuperAssesment
//
//  Created by APPLE on 19/12/25.
//

import Foundation

struct ServiceDummyData {
    
    static let services: [Service] = [
        Service(
            title: "Office Space Revamp",
            customer: "XYZ Industries",
            description: "Transform your office with sleek, contemporary furnishings.",
            status: .planned,
            time: "Today, 3:00 PM",
            location: "Maple Avenue, Seattle, WA 98101",
            notes: "Ensure all furniture is removed before renovation begins.",
            lat: "47.6062",
            lon: "–122.3321"
        ),
        
        Service(
            title: "Modern Workspace Makeover",
            customer: "Acme Corp",
            description: "Revitalize your workspace with stylish modern decor.",
            status: .scheduled,
            time: "Today, 3:30 PM",
            location: "Pine Street, Seattle, WA",
            notes: "Confirm decor theme with client.",
            lat: "47.6098441",
            lon: "-122.3405005"
        ),
        
        Service(
            title: "Contemporary Office Transformation",
            customer: "Beta Solutions",
            description: "Chic designs that spark inspiration.",
            status: .confirmed,
            time: "Today, 4:00 PM",
            location: "Downtown Seattle",
            notes: "Finalize wall colors.",
            lat: "47.6125",
            lon: "-122.3354"
        ),
        
        Service(
            title: "Modern Workspace Overhaul",
            customer: "Alpha Innovations",
            description: "Transform your workspace with stylish, cutting-edge designs that spark inspiration.",
            status: .approved,
            time: "Today, 5:00 PM",
            location: "Downtown Seattle",
            notes: "Finalize wall colors.",
            lat: "47.611300",
            lon: "-122.337200"
        ),
        
        Service(
            title: "Revamp Your Workspace Today",
            customer: "Innovations Solutionss Inc.",
            description: "Transform your workspace with stylish, cutting-edge designs that spark inspiration.",
            status: .approved,
            time: "Today, 6:00 PM",
            location: "Downtown Seattle",
            notes: "Finalize wall colors.",
            lat: "47.611900",
            lon: "-122.336000"
        )
    ]
}
