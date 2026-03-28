//
//  ContentView.swift
//  DummySwiftUIProject
//
//  Created by APPLE on 30/12/25.
//

import SwiftUI

struct ContentView: View {
    @State var userName: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var navigateScreen: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding(.top, 30)
                Spacer()
                VStack(alignment: .center) {
                    
                    Text("Login")
                        .font(.title)
                        .bold()
                        .foregroundColor(.black)
                        .padding(.bottom,50)
                    VStack(alignment: .leading, spacing: 5) {
                        //                        Text("E-mail")
                        //                            .font(.subheadline)
                        //                            .padding(.leading)
                        //                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        //                        TextField("User Email", text: $email)
                        //                            .padding()
                        //                            .background(Color.gray.opacity(0.1))
                        //                            .cornerRadius(10)
                        //                            .keyboardType(.emailAddress)
                        TextLabel(title: "E-mail")
                        InputView(title: "User Email", text: $email)
                        //                        Text("Password")
                        //                            .font(.subheadline)
                        //                            .padding(.leading)
                        //                            .frame(maxWidth: .infinity, alignment: .leading)
                        //                        SecureField("User Password", text: $password)
                        //                            .padding()
                        //                            .background(Color.gray.opacity(0.1))
                        //                            .cornerRadius(10)
                        TextLabel(title: "Password")
                        PasswordInputView(title: "User Password", text: $password)
                        Button {
                            print("Click Buttoon Forget Button")
                        } label: {
                            Text("Forget Password?")
                        }
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.trailing)
                        .padding(.bottom,70)
                        
                        Button {
                            print("Login Button")
                            navigateScreen = true
                        } label: {
                            Text("Login")
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.black)
                        .foregroundColor(.white)
                        .clipShape(.capsule)
                        NavigationLink (
                            destination: UserProfileView(userName: email),
                            isActive: $navigateScreen
                        ){
                            EmptyView()
                        }
                    }
                    .padding(.horizontal)
                }
                Spacer()
                HStack(alignment: .bottom) {
                    Text("Don't have any account?")
                        .foregroundColor(.gray)
                    NavigationLink(destination: {
                        RegisterView()
                    }, label: {
                        Text("Sign Up")
                    })
                    .foregroundColor(.black)
                    .font(.title3)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

struct ReactagleView: View {
    private let parantSSize: CGFloat = 250
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.blue)
                .frame(width: parantSSize, height: parantSSize)
                .border(.black, width: 2)
            
            Rectangle()
                .fill(Color.cyan)
                .frame(width: parantSSize/sqrt(2), height: parantSSize/sqrt(2))
                .border(.black, width: 2)
                .rotationEffect(.init(degrees: 45))
            
        }
    }
}

struct InputView: View {
    let title: String
    @Binding var text: String
    var body: some View {
        TextField(title, text: $text)
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}

struct PasswordInputView: View {
    let title: String
    @Binding var text: String
    @State private var isSecure: Bool = false
    var body: some View {
        HStack {
            if isSecure {
                SecureField(title, text: $text)
            } else {
                TextField(title, text: $text)
            }
            
            Button {
                isSecure.toggle()
            } label: {
                Image(systemName: isSecure ? "eye.slash" : "eye")
            }
        }
        .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}

struct TextLabel: View {
    let title: String
    var body: some View {
        Text(title)
            .font(.subheadline)
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
