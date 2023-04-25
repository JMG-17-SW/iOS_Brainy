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
    @State private var toggle: Bool = false
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        VStack(alignment: .center){
            Form{
                Section(header: Text("Email")) {
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)

                }
                
                Section(header: Text("PW")) {
                    SecureField("PW", text: $pw)
                        .textInputAutocapitalization(.never)

                    SecureField("PW Check", text: $pwCheck)
                        .textInputAutocapitalization(.never)

                }
                
                Section(header: Text("Nickname")) {
                    TextField("Nickname", text: $nickname)
                        .textInputAutocapitalization(.never)
                }
                
                Button {
                    viewModel.SignUp(email, pw)
                } label: {
                    //                Text("START").foregroundColor(pw == pwCheck && !email.isEmpty && !pw.isEmpty ? Color.blue: Color.gray)
                    Text("Sign Up")
                }.disabled(toggle)
            }
            
            
            
        }
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
