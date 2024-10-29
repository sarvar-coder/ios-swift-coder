//
//  Factories.swift
//  Bankey
//
//  Created by Sarvar Boltaboyev on 27/10/24.
//

import Foundation
import UIKit

func makeLabel(text: String, font: UIFont.TextStyle) -> UILabel {
    let label = UILabel()
    label.text = text
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = .preferredFont(forTextStyle: font)
    
    return label
}
