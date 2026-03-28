//
//  ServiceListRowView.swift
//  ZuperAssesment
//
//  Created by APPLE on 19/12/25.
//

import SwiftUI

struct ServiceListRowView: View {
    let service: Service
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            HStack {
                Text(service.title)
                    .font(.headline)
                    .fontWeight(.semibold)
                Spacer()
                
                Circle()
                    .fill(Color(service.status.color))
                    .frame(width: 10, height: 10)
            }
            
            HStack(spacing: 6) {
                Image(systemName: "person.circle")
                    .foregroundColor(.blue)
                Text(service.customer)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            HStack(alignment: .top, spacing: 6) {
                Image(systemName: "doc.text")
                    .foregroundColor(.blue)
                Text(service.description)
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .lineLimit(2)
            }
            
            HStack {
                Text(service.status.rawValue)
                    .font(.caption)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Color(service.status.color).opacity(0.15))
                    .foregroundColor(Color(service.status.color))
                    .cornerRadius(16)
                
                Spacer()
                
                Text(service.time)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.black.opacity(0.25), lineWidth: 1)
        )
        .listRowBackground(Color.clear)
        //.shadow(color: .black.opacity(0.05), radius: 6, x: 0, y: 3)
        .shadow(color: .black.opacity(0.08), radius: 4, x: 0, y: 2)
    }
}
