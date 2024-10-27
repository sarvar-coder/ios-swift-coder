//
//  UIViewControllers+Ext.swift
//  Bankey
//
//  Created by Sarvar Boltaboyev on 27/10/24.
//

import UIKit

extension UIViewController {
    // New
    func setStatusBar() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithTransparentBackground() // to hide Navigation Bar Line also
        navBarAppearance.backgroundColor = appColor
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
    }
    
    func setTabBarImage(imageName: String, text: String)  {
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: text, image: image, tag: 0)
    }
}
