//
//  PasswordResetView.swift
//  Brainy
//
//  Created by 김경호 on 2023/05/09.
//

import SwiftUI

struct PasswordResetView: View {
    @State private var email = ""
    @StateObject private var viewModel = LoginViewModel()
    @State private var resetFail = false
    @State private var resetSuccess = false
    
    var body: some View {
        Form{
            Section("") {
                TextField("name", text: $email)
                    .textInputAutocapitalization(.never)
            }
            Section("") {
                Button {
                    viewModel.PasswordReset(email)
                    resetFail = viewModel.passResetFail
                    resetSuccess = !viewModel.passResetFail
                } label: {
                    Text("Password Resset")
                }.alert("잘못된 이메일입니다.", isPresented: $resetFail, actions: {
                    Button("OK", role: .cancel){}
                })
                .alert("이메일을 전송했습니다.", isPresented: $resetSuccess) {
                    Button("OK", role: .cancel){}
                }
                .fullScreenCover(isPresented: $resetSuccess) {
                    LoginView()
                }
//                .sheet(isPresented: $resetSuccess) {
//                    LoginView()
//                }
            }
            
            
            
        }
    }
}

struct PasswordResetView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordResetView()
    }
}
