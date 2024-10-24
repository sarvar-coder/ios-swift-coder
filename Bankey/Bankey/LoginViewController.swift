//
//  LoginViewController.swift
//  Bankey
//
//  Created by Sarvar Boltaboyev on 24/10/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    let titleLablel = UILabel()
    let subtitleLabel = UILabel()
    
    let loginView = LoginView()
    let signInbutton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    var username: String? {
        loginView.userNameTextField.text
    }
    
    var password: String? {
        loginView.paswordTextField.text
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
}

extension LoginViewController {
    
   private func style() {
       
       
       titleLablel.translatesAutoresizingMaskIntoConstraints = false
       titleLablel.textAlignment = .center
       titleLablel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
       titleLablel.adjustsFontForContentSizeCategory = true
       titleLablel.text = "Bankey"
       
       subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
       subtitleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
       subtitleLabel.text = "Your premium source for all things banking!"
       subtitleLabel.adjustsFontForContentSizeCategory = true
       subtitleLabel.numberOfLines = 0
       subtitleLabel.lineBreakMode = .byWordWrapping
       
       subtitleLabel.textAlignment = .center
       
       loginView.translatesAutoresizingMaskIntoConstraints = false
       
       signInbutton.translatesAutoresizingMaskIntoConstraints = false
       signInbutton.configuration = .filled()
       signInbutton.configuration?.imagePadding = 8  // for indicator spacing
       signInbutton.setTitle("Sign In", for: [])
       signInbutton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
       
       errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
       errorMessageLabel.textColor = .systemRed
       errorMessageLabel.textAlignment = .center
       errorMessageLabel.isHidden = true
       errorMessageLabel.numberOfLines = 0
       
    }
    
   private func layout() {
       view.addSubview(titleLablel)
       view.addSubview(subtitleLabel)
       view.addSubview(loginView)
       view.addSubview(signInbutton)
       view.addSubview(errorMessageLabel)
       
       
       // TitleLabel
       NSLayoutConstraint.activate([
        subtitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLablel.bottomAnchor, multiplier: 3),
        titleLablel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
       ])
       
       // SubtitleLabel
       NSLayoutConstraint.activate([
        loginView.topAnchor.constraint(equalToSystemSpacingBelow: subtitleLabel.bottomAnchor, multiplier: 3),
        subtitleLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor  ),
        subtitleLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
       ])
       
       // LoginView
       NSLayoutConstraint.activate([
        loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
        view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
       ])
       
       // Button
       NSLayoutConstraint.activate([
        signInbutton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
        signInbutton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
        signInbutton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
       ])
       
       // Error Label
       NSLayoutConstraint.activate([
        errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInbutton.bottomAnchor, multiplier: 2),
        errorMessageLabel.leadingAnchor.constraint(equalTo: signInbutton.leadingAnchor),
        errorMessageLabel.trailingAnchor.constraint(equalTo: signInbutton.trailingAnchor)
       ])
    }
}

// MARK: - ACTIONS
extension LoginViewController {
    @objc func signInTapped(sender: UIButton) {
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login() {
        guard let username = username,
              let password = password else {
            assertionFailure("Username / Password should never be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(with: "Username / password cannot be blank ")
            return
        }
        
        if username == "Sarvar" && password == "quyoncha" {
            signInbutton.configuration?.showsActivityIndicator = true
        } else {
            configureView(with: "Invalid password / username")
        }
    }
    
    private func configureView(with message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
        
    }
}
