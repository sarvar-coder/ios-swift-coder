//
//  ViewController.swift
//  Password
//
//  Created by Sarvar Boltaboyev on 02/11/24.
//

import UIKit

class ViewController: UIViewController {

    let stackView = UIStackView()
    let passwordTextField = PasswordTextField(placeHolderText: "New password ")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension ViewController {
    func style() {
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
    }
    
    func layout() {
        stackView.addArrangedSubview(passwordTextField)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            stackView.trailingAnchor.constraint(equalToSystemSpacingAfter: view.trailingAnchor, multiplier: 2),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
