//
//  FormView.swift
//  FirstAppSwiftUI
//
//  Created by APPLE on 10/09/25.
//

import SwiftUI

struct FormView: View {
    var body: some View {
        Form {
            
            Text("Hello, World!")
            Text("Hello, World!")
        
        Section(header: Text("List1").font(.title)) {
            Text("Hello, World!")
            Text("Hello, World!")
            Text("Hello, World!")
            Text("Hello, World!")
            Text("Hello, World!")
        }
            Section(header: Text("List2").font(.title)) {
            Text("Hello, World!")
            Text("Hello, World!")
            Text("Hello, World!")
            Text("Hello, World!")
        }
    }
    }
}

#Preview {
    FormView()
}
