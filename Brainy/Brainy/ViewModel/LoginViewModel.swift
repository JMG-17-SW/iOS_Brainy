//
//  LoginViewModel.swift
//  Brainy
//
//  Created by 김경호 on 2023/04/08.
//

import Foundation
import Firebase

class LoginViewModel: ObservableObject{
    
    func Login(_ id: String, _ pw: String){
        Auth.auth().signIn(withEmail: id, password: pw){ result, error in
            
            if let error = error{
                print("Login Fail: \(error)")
            } else {
                print("Login Success: \(result)")
            }
            
        }
    }
}
