//
//  AppDelegate.swift
//  Bankey
//
//  Created by Sarvar Boltaboyev on 24/10/24.
//

import UIKit

let appColor: UIColor = .systemTeal

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    let loginViewController = LoginViewController()
    let onboardingViewController = OnboardingViewController()
    let mainViewController = MainViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
    
        loginViewController.delegate = self
        onboardingViewController.delegate = self
        
        registerForNotifications()
        window?.rootViewController = onboardingViewController
//        displayLOginView()
        return true
    }
    
    private func registerForNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(didLogout), name: .logout, object: nil)
    }
    
    private func displayLOginView() {
        setRootViewControllers(loginViewController)
    }
    
    private func displayNextScreen() {
        if LocalState.hasOnboarded {
            prepMainView()
            setRootViewControllers(mainViewController)
        } else {
            setRootViewControllers(onboardingViewController)
        }
    }
    
    private func prepMainView() {
        mainViewController.setStatusBar()
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().backgroundColor = appColor
    }
}

extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        displayNextScreen()
    }
}

extension AppDelegate: OnboardingViewControllerDelegate {
    func didFinishOnboarding() {
        LocalState.hasOnboarded.toggle()
        prepMainView()
        setRootViewControllers(mainViewController)
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

extension AppDelegate {
    @objc func didLogout() {
        setRootViewControllers(loginViewController)
    }
}
