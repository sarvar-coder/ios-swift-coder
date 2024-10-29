//
//  LoginViewController.swift
//  Bankey
//
//  Created by Sarvar Boltaboyev on 24/10/24.
//

import UIKit


protocol LoginViewControllerDelegate: AnyObject {
    func didLogin()
}

class LoginViewController: UIViewController {
    
    let titleLablel = UILabel()
    let subtitleLabel = UILabel()
    
    let loginView = LoginView()
    let signInbutton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    weak var delegate: LoginViewControllerDelegate?
    
    var username: String? {
        loginView.userNameTextField.text
    }
    
    var password: String? {
        loginView.paswordTextField.text
    }
    
    // animation
    var leadingEdgeOnScreen: CGFloat = 16
    var leadingEdgeOffScreen: CGFloat = -1000
    
    var titleLeadingAnchor: NSLayoutConstraint?
    var subtitleLabelLeadingAnchor: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        signInbutton.configuration?.showsActivityIndicator = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animate()
        
    }
}

extension LoginViewController {
    
    private func style() {
        
        titleLablel.translatesAutoresizingMaskIntoConstraints = false
        titleLablel.textAlignment = .center
        titleLablel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        titleLablel.adjustsFontForContentSizeCategory = true
        titleLablel.text = "Bankey"
        titleLablel.alpha = 0
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        subtitleLabel.text = "Your premium source for all things banking!"
        subtitleLabel.adjustsFontForContentSizeCategory = true
        subtitleLabel.alpha = 0
        
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
        
        
        // Title
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLablel.bottomAnchor, multiplier: 3),
            titleLablel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        titleLeadingAnchor = titleLablel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingEdgeOffScreen)
        titleLeadingAnchor?.isActive = true
        
        // SubtitleLabel
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: subtitleLabel.bottomAnchor, multiplier: 3),
            subtitleLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        subtitleLabelLeadingAnchor = subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingEdgeOffScreen)
        subtitleLabelLeadingAnchor?.isActive = true
        
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
        
//                if username.isEmpty || password.isEmpty {
//                    configureView(with: "Username / password cannot be blank ")
//                    return
//                }
        
        if username == "" && password == "" {
            signInbutton.configuration?.showsActivityIndicator = true
            delegate?.didLogin()
        } else {
            configureView(with: "Invalid password / username")
        }
        
    }
    
    private func configureView(with message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
        shakeButton()
    }
}

// MARK: - Animation function
extension LoginViewController {
    func animate() {
        let duration = 2.0
        let animator1 = UIViewPropertyAnimator(duration: duration, curve: .easeInOut) {
            self.titleLeadingAnchor?.constant = self.leadingEdgeOnScreen
          

            self.view.layoutIfNeeded() // Use this method to force the view to update its layout immediately.
        }
        animator1.startAnimation()
        let animator2 = UIViewPropertyAnimator(duration: duration, curve: .easeInOut) {
            self.subtitleLabelLeadingAnchor?.constant = self.leadingEdgeOnScreen
            self.view.layoutIfNeeded()
        }
        animator2.startAnimation(afterDelay: 1)
        let animator3 = UIViewPropertyAnimator(duration: duration, curve: .easeInOut) {
            self.titleLablel.alpha = 1
            self.view.layoutIfNeeded()
        }
        animator3.startAnimation(afterDelay: 1)
        
        let animator4 = UIViewPropertyAnimator(duration: duration, curve: .easeInOut) {
            self.subtitleLabel.alpha = 1
            self.view.layoutIfNeeded()
        }
        animator4.startAnimation(afterDelay: 1)
        
    }
    private func shakeButton() {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.y"
        animation.keyPath =  "position.x"
        animation.values = [0, 10, -10, 10, 0]
        animation.keyTimes = [0, 0.16, 0.5, 0.83, 1]
        animation.duration = 0.4

        animation.isAdditive = true
        signInbutton.layer.add(animation, forKey: "shake")
    }
}
