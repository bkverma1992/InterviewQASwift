//
//  DetailsInfoView.swift
//  ZuperAssesment
//
//  Created by APPLE on 19/12/25.
//

import SwiftUI

struct DetailsInfoView: View {
    let icon: String
    let title: String
    let value: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 14) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(.blue)
                .frame(width: 24)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)                    .foregroundColor(.primary)
                
                Text(value)
                    .font(.body)
                    .foregroundColor(.secondary)
                
            }
        }
    }
}
