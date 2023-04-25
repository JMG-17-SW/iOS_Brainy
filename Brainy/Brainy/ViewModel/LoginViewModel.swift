//
//  LoginViewModel.swift
//  Brainy
//
//  Created by 김경호 on 2023/04/08.
//

import Foundation
import Firebase

class LoginViewModel: ObservableObject{
    func SignUp(_ id: String, _ pw: String){
        Auth.auth().createUser(withEmail: id, password: pw){ result, error in
            if let error = error{
                print("SignUp Fail: \(error)")
            } else {
                print("SignUp Success: \(String(describing: result))")
            }
        }
    }
    
    func Login(_ id: String, _ pw: String){
        if !id.isEmpty{
            print("Email is Empty")
        } else if !pw.isEmpty{
            print("PW is Empty")
        } else{
            Auth.auth().signIn(withEmail: id, password: pw){ result, error in
                if let error = error{
                    print("Login Fail: \(error)")
                } else {
                    print("Login Success: \(String(describing: result))")
                }
            }
        }
    }
}
