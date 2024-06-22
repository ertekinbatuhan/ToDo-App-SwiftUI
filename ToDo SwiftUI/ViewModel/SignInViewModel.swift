//
//  SignInViewModel.swift
//  ToDo SwiftUI
//
//  Created by Batuhan Berk Ertekin on 22.06.2024.
//

import Foundation
import Firebase


class SignInViewModel  : ObservableObject{
    
    @Published var email : String = ""
    @Published var password : String = ""
    @Published  var loginSuccesfull : Bool = false
    
    func signIn() {
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult , error in
            
            if let error = error {
                
                print(error.localizedDescription)
            } else {
            
                self.loginSuccesfull = true
            }
            
            
        }
        
    }
    
}
