//
//  LoginView.swift
//  Brainy
//
//  Created by 김경호 on 2023/04/07.
//

import SwiftUI


struct LoginView: View {
    @State private var id = ""
    @State private var pw = ""
    @State private var findPassword: Bool = false
    @State private var loginFail : Bool = false
    @State private var loginSuccess : Bool = false
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                GeometryReader{ geometry in
                    ZStack{
                        Color("MainColor").edgesIgnoringSafeArea(.all)
                        Text("Brainy")
                            .font(.custom("Bangers-Regular", size: 70))
//                            .font(.system(size: 50))
                            .foregroundColor(Color.white)
                    }.frame(height: geometry.size.height * 0.6)
                    
                    
                    VStack(spacing: 10){
                        Text("Email").frame(width: geometry.size.width * 0.8, alignment: .leading)
                        
                        TextField("  Enter your Email", text: $id)
                            .frame(width: geometry.size.width * 0.8, height: 30)
                            .overlay {
                                RoundedRectangle(cornerRadius: 2).stroke(Color.gray)
                            }
                            .textInputAutocapitalization(.never)
                        
                        Text("Password").frame(width: geometry.size.width * 0.8, alignment: .leading)
                        SecureField("  Enter your Password", text: $pw)
                            .frame(width: geometry.size.width * 0.8, height: 30)
                            .overlay {
                                RoundedRectangle(cornerRadius: 2)
                                    .stroke(Color.gray)
                            }
                            .textInputAutocapitalization(.never)
                        
                        Button {
                            viewModel.Login(id, pw)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                loginFail = !viewModel.loginSuccess
                                loginSuccess = viewModel.loginSuccess
                            }
                            print(loginSuccess)
                            
                        } label: {
                            Text("Sign In")
                                .foregroundColor(Color.white)
                        }
                        .fullScreenCover(isPresented: $loginSuccess, content: {
                            MainView()
                        })
//                        .sheet(isPresented: $loginSuccess, content: {
//                            MainView()
//                                .fu
//                        })
                        .alert(failInfo(id, pw), isPresented: $loginFail, actions: {
                            Button("OK", role: .cancel){}
                        })
                        
                        .frame(width: geometry.size.width * 0.8, height: 40)
                        .background(Color.blue)
                        
                        HStack(spacing: 120){
                            Button {
                                findPassword.toggle()
                            } label: {
                                Text("Forgot password")
                                    .foregroundColor(Color.gray)
                            }
                            .sheet(isPresented: $findPassword) {
                                PasswordResetView()
                            }
                            
                            NavigationLink(destination: SignUpView()) {
                                Text("Sign Up")
                            }
                            
                        }
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.4)
                    .offset(y: geometry.size.height * 0.6)
                } // GeometryReader
            } // VStack
        } // Navi
    } // body
}
extension LoginView{
    func failInfo(_ id: String, _ pw: String) -> String{
        if id.isEmpty {return "ID is Empty"}
        else if pw.isEmpty {return "PW is Empty"}
        
        return "Login Fail"
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
