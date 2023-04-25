//
//  LoginView.swift
//  Brainy
//
//  Created by 김경호 on 2023/04/07.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @State private var id = ""
    @State private var pw = ""
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                GeometryReader{ geometry in
                    ZStack{
                        Color("MainColor").edgesIgnoringSafeArea(.all)
                        Text("Brainy")
                            .font(.system(size: 50))
                            .foregroundColor(Color.white)
                    }.frame(height: geometry.size.height * 0.6)
                    
                    
                    VStack(spacing: 10){
                        TextField("", text: $id)
                        Text("Email")
                        
                        TextField("Enter your Email", text: $id)
                            .frame(width: geometry.size.width * 0.8, height: 30)
                            .overlay {
                                RoundedRectangle(cornerRadius: 2).stroke(Color.gray)
                            }
                            .textInputAutocapitalization(.never)
                        
                        Text("Password")
                        SecureField("Enter your Password", text: $pw)
                            .frame(width: geometry.size.width * 0.8, height: 30)
                            .overlay {
                                RoundedRectangle(cornerRadius: 2)
                                    .stroke(Color.gray)
                            }
                            .textInputAutocapitalization(.never)
                        
                        Button {
                            //                        viewModel.Login(id, pw)
                            for family: String in UIFont.familyNames{
                                print(family)
                                for names: String in UIFont.fontNames(forFamilyName: family){
                                    print("===\(names)")
                                }
                            }
                        } label: {
                            Text("Sign In")
                                .foregroundColor(Color.white)
                        }
                        .frame(width: geometry.size.width * 0.8, height: 40)
                        .background(Color.blue)
                        
                        HStack(spacing: 120){
                            Button {
                                
                            } label: {
                                Text("Forgot password")
                                    .foregroundColor(Color.gray)
                            }
                            
                            NavigationLink(destination: SignUpView()) {
                                Text("Sign Up")
                            }
                            
                        }
                    }
                    .frame(height: geometry.size.height * 0.4)
                    .offset(y: geometry.size.height * 0.6)
                }
                
            }
        }
            
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
