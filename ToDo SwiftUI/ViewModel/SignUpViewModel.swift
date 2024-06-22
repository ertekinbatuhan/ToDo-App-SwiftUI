//
//  SignUpViewModel.swift
//  ToDo SwiftUI
//
//  Created by Batuhan Berk Ertekin on 22.06.2024.
//

import Foundation
import Firebase


class SignUpViewModel : ObservableObject {
    
    @Published var fullName : String = ""
    @Published var email : String = ""
    @Published var password : String = ""
    @Published var registrationSuccessful: Bool = false

    func signUp() {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                
                    self.registrationSuccessful = true
                }
            }
        }}
