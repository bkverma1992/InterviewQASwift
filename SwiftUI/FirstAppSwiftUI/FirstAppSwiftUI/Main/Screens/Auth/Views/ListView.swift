//
//  ListView.swift
//  FirstAppSwiftUI
//
//  Created by APPLE on 04/09/25.
//

import SwiftUI

enum DestinationType {
    case swiftUI
    case form
    case stateAndB
}

struct ListView: View {
    @State var moview: [HumanList] = [
        HumanList(name: "SwiftUI", destination: .swiftUI),
        HumanList(name: "Form/Group/Section", destination: .form),
        HumanList(name: "State vs Binding", destination: .stateAndB),
        HumanList(name: "StateObject vs observedObject", destination: .stateAndB),
        HumanList(name: "EnvironmentObject", destination: .stateAndB),
        HumanList(name: "Publisher vs observable Object", destination: .stateAndB),
    ]
    
    var body: some View {
//        NavigationView {
        List(moview) { data in
            NavigationLink(destination: destinationView(for: data)) {
                Text(data.name)

            }
//            if data.name == "Form/Group/Section" {
//                NavigationLink(destination: FormView(name: data.name)) {
//                    Text(data.name)
//                }
//            }
//            else {
//                NavigationLink(destination: StateBindingView(name: data.name)) {
//                    HStack {
//                        Text(data.name)
//                        Spacer()
//                    }
//                }
//                
//            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Topics")
    }
}

#Preview {
   // ListView(, name: .contains(""))
    ListView()
}


@ViewBuilder
func destinationView(for data: HumanList) -> some View {
    switch data.destination {
    case .form:
        FormView()
    case .swiftUI:
        StateBindingView(name: data.name)
        
    default:
        FormView()
    }
}



//        HumanList(name: "Combine Framework"),
//        HumanList(name: "Unit Testing"),
//        HumanList(name: "OOPS"),
//        HumanList(name: "SOLID"),
//        HumanList(name: "Access Coontroller"),
//        HumanList(name: "Higher Order Function"),
//        HumanList(name: "Clouserss"),
//        HumanList(name: "Protocol"),
//        HumanList(name: "Delegate"),
//        HumanList(name: "Dipency Injection"),
//        HumanList(name: "Singleton"),
//        HumanList(name: "Class Vs Struct"),
//        HumanList(name: "value type vs Reference type"),
//        HumanList(name: "Initialiser"),
//        HumanList(name: "Any vs AnyObject"),
//        HumanList(name: "Defer"),
//        HumanList(name: "Async/Await"),
//        HumanList(name: "ARC"),
//        HumanList(name: "Memory Management"),
//        HumanList(name: "GCD"),
//        HumanList(name: "Sycn vs Async"),
//        HumanList(name: "Serial vs Concurrent"),
//        HumanList(name: "Operation Queue"),
//        HumanList(name: "Push Notificattion"),
//        HumanList(name: "Deep Link"),
//        HumanList(name: "Notification Centre"),
//        HumanList(name: "Touch ID"),
//        HumanList(name: "Face ID"),
//        HumanList(name: "App Sicurity"),
//        HumanList(name: "Realm/CoreData"),
//        HumanList(name: "Keychain"),
