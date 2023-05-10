//
//  SignUpView.swift
//  Brainy
//
//  Created by 김경호 on 2023/04/20.
//

import SwiftUI

struct SignUpView: View {
    @State private var email: String = ""
    @State private var pw: String = ""
    @State private var pwCheck: String = ""
    @State private var nickname: String = ""
    @State private var signupSuccess: Bool = false
    @State private var signupFail: Bool = false
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        VStack(alignment: .center){
            Form{
                Section(header: Text("Email")) {
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)

                }
                
                Section(header: Text("Password")) {
                    SecureField("New Password", text: $pw)
                        .textInputAutocapitalization(.never)

//                    SecureField("Confirm Password", text: $pwCheck)
//                        .textInputAutocapitalization(.never)
                }
                
                Section(header: Text("Name")) {
                    TextField("name", text: $nickname)
                        .textInputAutocapitalization(.never)
                }
                
                Button {
                    viewModel.SignUp(email, pw)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        print("Dispatch")
                        signupSuccess = viewModel.loginSuccess
                        signupFail = !viewModel.loginSuccess
                    }
                } label: {
                    Text("Sign Up")
                }.alert("SignUp Fail", isPresented: $signupFail, actions: {
                    Button("OK", role: .cancel){}
                })
                .fullScreenCover(isPresented: $signupSuccess) {
                    MainView()
                }
//                .sheet(isPresented: $signupSuccess, content: {
//                    MainView()
//                })
            }
        }
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
