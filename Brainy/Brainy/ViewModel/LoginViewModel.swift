//
//  LoginViewModel.swift
//  Brainy
//
//  Created by 김경호 on 2023/04/08.
//

import Foundation
import Firebase

class LoginViewModel: ObservableObject{
    @Published var currentUser: Firebase.User?
    @Published var loginSuccess: Bool = false
    @Published var passResetFail: Bool = false
    
    func SignUp(_ id: String, _ pw: String){
        Auth.auth().createUser(withEmail: id, password: pw){ [self] result, error in
            if let error = error{
                print("SignUp Fail: \(error)")
            } else {
                print("SignUp Success: \(String(describing: result))")
                self.currentUser = result?.user
                self.loginSuccess = true
            }
        }
        
    }
    
    func Login(_ id: String, _ pw: String){
        if id.isEmpty{
            print("Email is Empty")
        } else if pw.isEmpty{
            print("PW is Empty")
        } else{
            Auth.auth().signIn(withEmail: id, password: pw){ result, error in
                if let error = error{
                    print("Login Fail: \(error)")
                    return
                } else {
                    print("Login Success: \(String(describing: result))")
                    self.currentUser = result?.user
                    self.loginSuccess = true
                }
            }
        }
    }
    
    func Logout(){
        currentUser = nil
        try? Auth.auth().signOut()
    }
    
    func PasswordReset(_ id: String){
        Auth.auth().sendPasswordReset(withEmail: id){ error in
            if let error = error{
                print("Email Reset Fail : \(error)")
                return
            } else {
                print("Email Reset Success")
                self.passResetFail = true
            }
        }
    }
}
