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
    
    var body: some View {
        VStack{
            ZStack{
                Color("MainColor").edgesIgnoringSafeArea(.all)
                Text("Brainy")
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
            }
            VStack(spacing: 10){
                Text("Email")
                
                TextField("", text: $id)
                    .frame(maxWidth: 300, maxHeight: 30)
                    .overlay {
                        RoundedRectangle(cornerRadius: 2)
                            .stroke(Color.gray)
                    }
                
                Text("Password")
                TextField("", text: $pw)
                    .frame(width: 300, height: 30)
                    .overlay {
                        RoundedRectangle(cornerRadius: 2)
                            .stroke(Color.gray)
                    }
                
                Button {
                    
                } label: {
                    Text("Sign In")
                        .foregroundColor(Color.white)
                }
                .frame(width: 300, height: 40)
                .background(Color.blue)
                
                HStack(spacing: 150){
                    Button {
                        
                    } label: {
                        Text("Forgot password")
                            .foregroundColor(Color.gray)
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Sign up")
                    }


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
