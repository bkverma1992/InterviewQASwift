//
//  StateBindingView.swift
//  FirstAppSwiftUI
//
//  Created by APPLE on 04/09/25.
//

import SwiftUI
import PhotosUI

struct StateBindingView: View {
    @State var moview: [HumanList] = [
        HumanList(name: " Profile Using State vs Binding", destination: .swiftUI),
        HumanList(name: "StateObject vs observedObject", destination: .form),
        HumanList(name: "EnvironmentObject", destination: .stateAndB),
        HumanList(name: "Publisher vs observable Object", destination: .stateAndB),
        HumanList(name: "Combine Framework", destination: .stateAndB),
    ]
    
    var name: String
    var body: some View {
        List(moview) { data in
            NavigationLink(destination: stateView(userName: data.name)) {
                Text(data.name)
            }
            .navigationTitle(name)
        }
    }
}

#Preview {
    StateBindingView(name: "")
}


struct stateView: View {
    @State var userName: String = ""
    @State private var isSelected: Bool = false
    @State private var selectedImage: UIImage?
    @State private var selectedItem: PhotosPickerItem? = nil   // ✅ Correct type
    @State var text: String = ""
    var body: some View {
        
        VStack(alignment: .center, spacing: 20) {
            ZStack(alignment: .bottomTrailing) {
                Image(uiImage: selectedImage ?? UIImage(named: "1734535822227")!)
                    .resizable()
                    .scaledToFill()
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .frame(width: 180, height: 180)
                
                
                PhotosPicker(selection: $selectedItem, matching: .images) {
                    Image(systemName: "pencil.circle.fill")
                        .resizable()
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .frame(width: 30, height: 30)
                        .offset(x: -2, y: -2)
                }
            }
            Text("\(userName)")
                .font(.title)
            InputView(placeholder: "Enter Your Name ", text: $userName)
            
            NavigationLink("Next") {
//                userName = text
                BindingView(userName: $userName)
            }
            Spacer()
        }
        //        .frame(width: .infinity, height: .infinity, alignment: .top)
        .padding()
        
        .onChange(of: selectedItem) { newItem in
            Task {
                if let data = try? await newItem?.loadTransferable(type: Data.self),
                   let uiImage = UIImage(data: data) {
                    selectedImage = uiImage
                   
                }
            }
        }
        
    }
}


struct BindingView: View {
    @Binding var userName: String
    var body: some View {
        Button("Click") {
            userName = "\(Int.random(in: 1...100))"
        }
        Text("Binding Screen\(userName)")
    }
}
