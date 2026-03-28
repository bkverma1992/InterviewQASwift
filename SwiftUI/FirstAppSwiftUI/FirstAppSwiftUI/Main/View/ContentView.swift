//
//  ContentView.swift
//  FirstAppSwiftUI
//
//  Created by APPLE on 30/06/25.
//

import SwiftUI

struct ContentView: View {
    @State var userName: String = ""
    @State var userEmail: String = ""
    @State var userPswd: String = ""
    

    var body: some View {
        VStack {
          
            Text("Hello, Animals!").font(.bold(.title)())
            Image("p4").clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            
            Text("Bhupi").border(.red).lineSpacing(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/).frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .padding(.top, 20)
            Spacer()
            Button("Submit") {
                print("Clicked")
            }.bold()
            
            
        }
        
        .padding()
    }
}

#Preview {
    ContentView()
}
