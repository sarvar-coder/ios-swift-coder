//
//  AppDelegate.swift
//  Bankey
//
//  Created by Sarvar Boltaboyev on 24/10/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
//        window?.rootViewController = LoginViewController()
        window?.rootViewController = OnboardingViewController()
//        window?.rootViewController = FirstViewController(heroImage: "world", titleText: "Bankey is faster, easy to use and has a brand new look and feel that will make you feel like you are back in 1989")

        
        return true
    }
}

