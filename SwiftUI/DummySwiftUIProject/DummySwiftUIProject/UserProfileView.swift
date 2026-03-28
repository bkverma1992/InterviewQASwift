//
//  UserProfileView.swift
//  DummySwiftUIProject
//
//  Created by APPLE on 02/01/26.
//

import SwiftUI

struct UserProfileView: View {
    @State var userName: String = ""
    @State var userEmail: String = ""
    @State var userAdd: String = ""
    @State var userPostal: String = ""
    @State var showList: Bool = false
    var postalCode = ["283125", "282001", "283122", "284001", "233111", "111111"]
    @State var counterState: Int = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Click Count: \(counterState == 0 ? "" : String(counterState))")
                .font(.title)
                .bold()
                .foregroundColor(.black)
            Image("Bhupi")
                .resizable()
                .frame(width: 200, height: 200)
                .scaledToFit()
                .clipShape(.circle)
                .overlay(
                    Circle().stroke(.black, lineWidth: 2)
                )
            
            VStack(spacing: 20) {
                HStack {
                    Text("Name: ")
                        .frame(width: 120, alignment: .leading)
                    //                    TextField("User Name", text: $userName)
                    //                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    InputView(title: "User Name", text: $userName)
                    
                }
                HStack {
                    Text("Address: ")
                        .frame(width: 120, alignment: .leading)
                    //                    TextField("User Adddress", text: $userAdd)
                    //                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    InputView(title: "User Adddress", text: $userAdd)
                    
                }
                
                HStack(alignment: .top) {
                    Text("Postal Code: ")
                        .frame(width: 120, alignment: .leading)
                    ZStack(alignment: .topLeading) {
                        
                        TextField("User Postal Code", text: $userPostal)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                        //                        InputView(title: "User Postal Code", text: $userPostal)
                        
                            .onTapGesture {
                                print("Do Action")
                                showList = true
                                
                            }
                            .zIndex(1)
                        
                        if showList {
                            ScrollView {
                                
                                VStack(spacing: 0) {
                                    ForEach(postalCode.filter {
                                        userPostal.isEmpty ? true : $0.contains(userPostal)
                                    }, id: \.self) { code in
                                        Text(code)
                                            .padding(10)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .background(Color.blue.opacity(0.1))
                                            .onTapGesture {
                                                userPostal = code
                                                showList = false
                                            }
                                        Divider()
                                    }
                                }
                            }
                            .frame(maxHeight: 140)
                            .background(Color.white)
                            .cornerRadius(6)
                            .shadow(radius: 3)
                            .offset(y: 40) // move dropdown below TextField
                            .zIndex(10) // ensure dropdown above other views
                        }
                    }
                }
                HStack {
                    Text("Email: ")
                        .frame(width: 120, alignment: .leading)
                    //                    TextField("User Email", text: $userEmail)
                    //                        .padding(.trailing)
                    //                        .frame(alignment: .trailing)
                    //                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    //                        .keyboardType(.emailAddress)
                    //                        .lineLimit(5)
                    InputView(title: "User Email", text: $userEmail)
                    
                }
            }
            .padding(.bottom, 50)
            Button {
                counterState += 1
                print("Name: \(userName),Add: \(userAdd),Postal: \(userPostal),Email: \(userEmail)")
            } label: {
                Text("Update")
            }
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(Color.black)
            .clipShape(.capsule)
            Spacer()
        }
        .padding()
        
        
    }
}

#Preview {
    UserProfileView(userName: "Bhupi")
}
