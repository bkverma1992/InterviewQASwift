//
//  ServiceDetails.swift
//  ZuperAssesment
//
//  Created by APPLE on 19/12/25.
//

import SwiftUI
import MapKit

struct ServiceDetails: View {
    let service: Service
    
    var body: some View {
        ScrollView {
            Divider()
            VStack(alignment: .leading, spacing: 16) {
                Map(coordinateRegion: .constant(
                    MKCoordinateRegion(
                        center: CLLocationCoordinate2D(latitude: Double(service.lat) ?? 0.0, longitude: Double(service.lon) ?? 0.0),
                        span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                    )
                ))
                .frame(height: 200)
                .cornerRadius(12)
                
                HStack {
                    Text(service.title)
                        .font(.title2)
                        .bold()
                    
                    Spacer()
                    
                    Text(service.status.rawValue)
                        .font(.caption)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(service.status.color.opacity(0.15))
                        .foregroundColor(service.status.color)
                        .cornerRadius(14)
                }
                
                DetailsInfoView(icon: "person.crop.circle", title: "Customer", value: service.customer)
                DetailsInfoView(icon: "doc.text", title: "Description", value: service.description)
                DetailsInfoView(icon: "clock", title: "Scheduled Time", value: service.time)
                DetailsInfoView(icon: "mappin.and.ellipse", title: "Location", value: service.location)
                DetailsInfoView(icon: "note.text", title: "Service Notes", value: service.notes)
                
            }
            .padding()
        }
        .navigationTitle("Service Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}
