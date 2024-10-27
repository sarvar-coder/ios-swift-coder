//
//  LogoutViewController.swift
//  Bankey
//
//  Created by Sarvar Boltaboyev on 26/10/24.
//

import UIKit



class LogoutViewController: UIViewController {
    

    let button = UIButton(type: .system)
    weak var delegate: LogoutViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log out", for: .normal)
        
        button.addTarget(self, action: #selector(buttonTapped), for: .primaryActionTriggered)
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    @objc func buttonTapped(_ sender: UIButton) {
        delegate?.didTap()
    }  
}
