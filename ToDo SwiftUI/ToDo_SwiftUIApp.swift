//
//  ToDo_SwiftUIApp.swift
//  ToDo SwiftUI
//
//  Created by Batuhan Berk Ertekin on 22.06.2024.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}


@main
struct ToDo_SwiftUIApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
  

    var body: some Scene {
        WindowGroup {
            
            SignInView()
        }
    }
}
