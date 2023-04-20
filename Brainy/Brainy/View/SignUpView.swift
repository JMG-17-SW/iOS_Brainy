//
//  SignUpView.swift
//  Brainy
//
//  Created by 김경호 on 2023/04/20.
//

import SwiftUI

struct SignUpView: View {
    @State private var nickname: String = ""
    
    var body: some View {
        VStack(alignment: .center){
            Text("ENTER YOUR NICKNAME")
//                .foregroundColor(Color("MainColor"))
                .font(.custom("KohinoorBangla-Regular", size: 40))
            TextField("hello", text: $nickname)
                .overlay(content: {
                    Rectangle()
                })
                .padding()
            
            Button {
                
            } label: {
                Text("START")
            }

        }
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
