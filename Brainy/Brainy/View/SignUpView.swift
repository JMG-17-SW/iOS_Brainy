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
            Spacer()
            
            Text("Sign Up")
                .font(.custom("Bangers-Regular", size: 40))
                .foregroundColor(Color("MainColor"))
                .padding(.bottom, 50)
            VStack {
                Text("Email")
                    .frame(width: 300, alignment: .leading)
                TextField(" Input your Email", text: $email)
                    .frame(width: 300, height: 30)
                    .overlay {
                        RoundedRectangle(cornerRadius: 2)
                            .stroke(Color.gray)
                    }
            }.padding()
            
            VStack{
                Text("Password")
                    .frame(width: 300, alignment: .leading)
                TextField(" Input your Password", text: $pw)
                    .frame(width: 300, height: 30)
                    .overlay {
                        RoundedRectangle(cornerRadius: 2)
                            .stroke(Color.gray)
                    }
            }
            Spacer()
            Spacer()
            
            
//            Form{
//                Section(header: Text("Email")) {
//                    TextField("Email", text: $email)
//                        .keyboardType(.emailAddress)
//                        .textInputAutocapitalization(.never)
//
//                }
//
//                Section(header: Text("Password")) {
//                    SecureField("New Password", text: $pw)
//                        .textInputAutocapitalization(.never)
//
////                    SecureField("Confirm Password", text: $pwCheck)
////                        .textInputAutocapitalization(.never)
//                }
//
//                Section(header: Text("Name")) {
//                    TextField("name", text: $nickname)
//                        .textInputAutocapitalization(.never)
//                }
//
//                Button {
//                    viewModel.SignUp(email, pw)
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                        print("Dispatch")
//                        signupSuccess = viewModel.loginSuccess
//                        signupFail = !viewModel.loginSuccess
//                    }
//                } label: {
//                    Text("Sign Up")
//                }.alert("SignUp Fail", isPresented: $signupFail, actions: {
//                    Button("OK", role: .cancel){}
//                })
//                .fullScreenCover(isPresented: $signupSuccess) {
//                    MainView()
//                }
////                .sheet(isPresented: $signupSuccess, content: {
////                    MainView()
////                })
//            }
        }
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
