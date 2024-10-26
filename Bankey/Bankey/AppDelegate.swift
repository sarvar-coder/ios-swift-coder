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
    
    let loginViewController = LoginViewController()
    let onboardingViewController = OnboardingViewController()
    let logoutViewController = LogoutViewController()
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        loginViewController.delegate = self
        onboardingViewController.delegate = self
        logoutViewController.delegate = self
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        window?.rootViewController = loginViewController
        //        window?.rootViewController = onboardingViewController
        
        return true
    }
}

extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        if LocalState.hasOnboarded {
            setRootViewControllers(logoutViewController)
        } else {
            setRootViewControllers(onboardingViewController)
        }
    }
}

extension AppDelegate: OnboardingViewControllerDelegate {
    func didFinishOnboarding() {
        LocalState.hasOnboarded.toggle()
        setRootViewControllers(logoutViewController)
    }
}

extension AppDelegate {
    func setRootViewControllers(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil
        )
    }
}

extension AppDelegate: LogoutViewControllerDelegate {
    func didTap() {
        setRootViewControllers(loginViewController)
    }
}
