//
//  AccountSummaryHeaderView.swift
//  Bankey
//
//  Created by Sarvar Boltaboyev on 27/10/24.
//

import Foundation
import UIKit

class AccountSummaryHeaderView: UIView {
    
    let stackViewH = UIStackView()
    let stackView = UIStackView()
    let titleLabel = makeLabel(text: "Bankey", font: .title1)
    let greetingLabel = makeLabel(text: "Good Morning", font: .body)
    let nameLabel = makeLabel(text: "Sarvar", font: .body)
    let dateLabel = makeLabel(text: "\(Date().formatted(date: .abbreviated, time: .omitted ))", font: .body)
    let imageView = UIImageView()
    let shakeyBellView = ShakeyBellView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = appColor
        style()
        layout()
        
    }
    
    func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        
        stackViewH.translatesAutoresizingMaskIntoConstraints = false
        stackViewH.axis = .horizontal
        stackViewH.spacing = 40
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemYellow
        let configuration = UIImage.SymbolConfiguration(scale: .medium )
        let image = UIImage(systemName: "sun.max.fill", withConfiguration: configuration)
        imageView.image = image
        
        shakeyBellView.translatesAutoresizingMaskIntoConstraints = false
        shakeyBellView.isUserInteractionEnabled = true
    }
    
    func
    layout() {
        addSubview(stackViewH)
        stackViewH.addArrangedSubview(stackView)
        stackViewH.addArrangedSubview(imageView)
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(greetingLabel)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(dateLabel)
        
        addSubview(shakeyBellView)
        
        NSLayoutConstraint.activate([
            stackViewH.topAnchor.constraint(equalTo: topAnchor),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackViewH.bottomAnchor, multiplier: 2),
            stackViewH.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackViewH.trailingAnchor, multiplier: 2) ,
            shakeyBellView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            shakeyBellView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
