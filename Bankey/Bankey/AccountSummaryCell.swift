//
//  AccountSummaryCell.swift
//  Bankey
//
//  Created by Sarvar Boltaboyev on 27/10/24.
//

import Foundation
import UIKit

 class AccountSummaryCell: UITableViewCell {
    
     let typeLabel = UILabel()
     let dividerView = UIView()
     let nameLabel = UILabel()
     
     let stackView = UIStackView()
     let balanceLabel = UILabel()
     let balanceAmount = UILabel()
     
     let chevronImage = UIImageView()
    
     static let reuseId = "AccountSummaryCell"
     static let rowHeight: CGFloat = 100
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AccountSummaryCell {
    
    private func setup() {
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.text = "Account type"
        typeLabel.font = .preferredFont(forTextStyle: .caption1)
        typeLabel.adjustsFontForContentSizeCategory = true
        
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = appColor
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Name Label"
        nameLabel.adjustsFontForContentSizeCategory = true
        nameLabel.font = .preferredFont(forTextStyle: .body)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceLabel.font = .preferredFont(forTextStyle: .body)
        balanceLabel.textAlignment = .right
        balanceLabel.text = "Balance Label"
        
        balanceAmount.translatesAutoresizingMaskIntoConstraints = false
        balanceAmount.text = "$954,434.54"
        balanceAmount.textAlignment = .right
        
        chevronImage.translatesAutoresizingMaskIntoConstraints = false
        chevronImage.tintColor = appColor
        chevronImage.image = UIImage(systemName: "chevron.right")
        
        
        
         
        
    }
    private func layout() {
        contentView.addSubview(typeLabel)
        contentView.addSubview(dividerView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(balanceLabel)
        stackView.addArrangedSubview(balanceAmount)
        contentView.addSubview(chevronImage)
        
        
        // Type label
        NSLayoutConstraint.activate( [
            typeLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            typeLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2)
        ])
        // divider view
        dividerView.heightAnchor.constraint(equalToConstant: 4).isActive = true
        dividerView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        dividerView.leadingAnchor.constraint(equalTo: typeLabel.leadingAnchor).isActive = true
        dividerView.topAnchor.constraint(equalToSystemSpacingBelow: typeLabel.bottomAnchor, multiplier: 1).isActive = true
        // NAme label
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: typeLabel.leadingAnchor),
            nameLabel.topAnchor.constraint(equalToSystemSpacingBelow: dividerView.bottomAnchor, multiplier: 2)
        ])
        // balance stackView
        NSLayoutConstraint.activate( [
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: dividerView.bottomAnchor, multiplier: 0),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 4),
            stackView.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 4),
        ])
        NSLayoutConstraint.activate([
            chevronImage.topAnchor.constraint(equalToSystemSpacingBelow: dividerView.bottomAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: chevronImage.trailingAnchor, multiplier: 1)
        ])
    }
}
