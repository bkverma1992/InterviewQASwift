//
//  LoginView.swift
//  FirstAppSwiftUI
//
//  Created by APPLE on 07/07/25.
//

import SwiftUI
struct HumanList: Identifiable {
    var id = UUID()
    let name: String
    let favorite: Bool = false
    let destination: DestinationType
}

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    //    @State var welcomeName: String = ""
    
    
    var body: some View {
        //        ScrollView {
        NavigationView {
            
            VStack(spacing: 20) {
                Image("p4")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(height: 280)
                    .shadow(color: .gray, radius: 2)
                
                //            Spacer(minLength: 20)
                VStack{
                    Text("Bhoopendra Kumar")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    Text("Sr. iOS Developer")
                        .font(.title2)
                    Spacer().frame(height:12)
                    Divider()
                    HStack(spacing: 50) {
                        VStack{
                            Text("Swift")
                                .fontWeight(.medium)
                                .multilineTextAlignment(.center)
                            HStack(spacing: 50) {
                                Text("6 Years")
                                    .multilineTextAlignment(.center)
                            }
                        }
                        VStack{
                            Text("SwiftUI")
                                .fontWeight(.medium)
                                .multilineTextAlignment(.center)
                            Text("1 Year")
                                .multilineTextAlignment(.center)
                        }
                        VStack{
                            Text("Objectice C")
                                .fontWeight(.medium)
                                .multilineTextAlignment(.center)
                            Text("1.5 Years")
                                .multilineTextAlignment(.center)
                        }
                    }
                    
                    Divider()
                    Button(action: {
                        print("Click Doobe")
                    }, label: {
                        NavigationLink("List Screen", destination: ListView())
                    })
                    .buttonStyle(.bordered)
                }}
        }.onAppear{
            // loopFunctionlity()
        }
    }
}

#Preview {
    LoginView()
}

//func loopFunctionlity() {
//    var arr = [3,4,5,6,7,8,9,10]
//    var dict:[Int: Int] = [:]
//    var target = 19
//    for (index, value) in arr.enumerated() {
//        var val = target - value
//        if let foundIndex = dict[val] {
//            print("found val \(value) + \(val) = \(target)")
//            print("found Index \(index)")
//            return
//        }
//        dict[value] = index
//   
//    }
//}

// textfld
//
//                InputView(placeholder: "Enter Email Or Phone Number", iconName: "envelop", text: $email).border(.gray)
//                    .cornerRadius(2)
//                    .frame(height: 50)
//
//                InputView(placeholder: "Enter Paaword", issSecureField: true, iconName: "lock", text: $password).border(.gray)
//                    .cornerRadius(2)
//                    .frame(height: 50)
