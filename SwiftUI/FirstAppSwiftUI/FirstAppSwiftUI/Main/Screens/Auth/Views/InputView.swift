//
//  InputView.swift
//  FirstAppSwiftUI
//
//  Created by APPLE on 07/07/25.
//

import SwiftUI

struct InputView: View {
    let placeholder: String
    var issSecureField: Bool = false
    var iconName: String? = nil
    @Binding var text: String
    
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                if let iconName = iconName {
                    Image(systemName: iconName)
                        .foregroundColor(.gray)
                }
                if issSecureField {
                    SecureField(placeholder, text: $text)
                        .padding(.leading, iconName != nil ? 8 : 0)
                    
                } else {
                    TextField(placeholder, text: $text)
                        .padding(.leading, iconName != nil ? 8 : 0)
                }
            }
            Divider()
                .background(Color.gray)
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    VStack {
        InputView(placeholder: "Email Or Phone Number", iconName: "envolope", text: .constant(""))
        InputView(placeholder: "Password", iconName: "lock", text: .constant(""))

    }
    .padding()
}
