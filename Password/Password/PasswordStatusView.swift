//
//  PasswordStatusView.swift
//  Password
//
//  Created by Sarvar Boltaboyev on 05/11/24.
//

import Foundation
import UIKit

class PasswordStatusView: UIView {
    
    let stackView = UIStackView()
    let criteriaLabel = UILabel()
    
    let lengthCriteriaView = PasswordCriteriaView(labelText: "8-32 characters (no spaces)")
    let uppercaseCriteriaView = PasswordCriteriaView(labelText: "uppercase letter (A-Z)")
    let lowerCaseCriteriaView = PasswordCriteriaView(labelText: "lowercase (a-z)")
    let digitCriteriaView = PasswordCriteriaView(labelText: "digit (0-9)")
    let specialCharacterCriteriaView = PasswordCriteriaView(labelText: "special character (e.g. !@#$%^)")

    // Used to determine if we reset criteria back to empty state (⚪️).
     var shouldResetCriteria: Bool = true
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: 200, height: 200)
    }
    
    private func makeCriteriaMessage() -> NSAttributedString {
        var plainTextAttributes = [NSAttributedString.Key: AnyObject]()
        plainTextAttributes[.font] = UIFont.preferredFont(forTextStyle: .subheadline)
        plainTextAttributes[.foregroundColor] = UIColor.secondaryLabel
        
        var boldTextAttributes = [NSAttributedString.Key: AnyObject]()
        boldTextAttributes[.foregroundColor] = UIColor.label
        boldTextAttributes[.font] = UIFont.preferredFont(forTextStyle: .subheadline)

        let attrText = NSMutableAttributedString(string: "Use at least ", attributes: plainTextAttributes)
        attrText.append(NSAttributedString(string: "3 of these 4 ", attributes: boldTextAttributes))
        attrText.append(NSAttributedString(string: "criteria when setting your password:", attributes: plainTextAttributes))

        return attrText
    }
    
    func reset() {
        lengthCriteriaView.reset()
        uppercaseCriteriaView.reset()
        lowerCaseCriteriaView.reset()
        digitCriteriaView.reset()
        specialCharacterCriteriaView.reset()
    }
    
    func validate(_ text: String) -> Bool {
        let uppercaseMet = PasswordCriteria.upperCaseMet(text)
        let lowercaseMet = PasswordCriteria.lowercaseMet(text)
        let digitMet = PasswordCriteria.digitMet(text)
        let specialCharacterMet = PasswordCriteria.specialCharMet(text)
        let lengthMet = PasswordCriteria.lengthAnsNoSpace(text)
        
let boolArray = [uppercaseMet, lowercaseMet, digitMet, specialCharacterMet]
        var returnTrue = 0
        for i in boolArray {
            if i == true {
                returnTrue += 1
            }
        }
        
        if lengthMet && returnTrue >= 3 {
            return true
        }
        return false
    }
}

extension PasswordStatusView {
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .tertiarySystemFill
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        lengthCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        uppercaseCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        lowerCaseCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        digitCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        specialCharacterCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        
        criteriaLabel.numberOfLines = 0
        criteriaLabel.lineBreakMode = .byWordWrapping
        criteriaLabel.attributedText = makeCriteriaMessage()
    }
    
    private func layout() {
        stackView.addArrangedSubview(lengthCriteriaView)
        stackView.addArrangedSubview(criteriaLabel)
        stackView.addArrangedSubview(uppercaseCriteriaView)
        stackView.addArrangedSubview(lowerCaseCriteriaView)
        stackView.addArrangedSubview(digitCriteriaView)
        stackView.addArrangedSubview(specialCharacterCriteriaView)
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 2)
        ])
    }
}

// MARK: Actions
extension PasswordStatusView {
    func updateDisplay(_ text: String) {
        let lengthAndNoSpaceMet = PasswordCriteria.lengthAnsNoSpace(text)
        let upperCaseMet = PasswordCriteria.upperCaseMet(text)
        let lowerCaseMet = PasswordCriteria.lowercaseMet(text)
        let digitMet = PasswordCriteria.digitMet(text)
        let specialCharMet = PasswordCriteria.specialCharMet(text)
        
        if shouldResetCriteria {
            // Inline validation (✅ or ⚪️)
            lengthAndNoSpaceMet
                ? lengthCriteriaView.isCriteriaMet = true
                : lengthCriteriaView.reset()
            
            upperCaseMet
                ? uppercaseCriteriaView.isCriteriaMet = true
                : uppercaseCriteriaView.reset()
            
            lowerCaseMet
                ? lowerCaseCriteriaView.isCriteriaMet = true
                : lowerCaseCriteriaView.reset()
            
            digitMet
                ? digitCriteriaView.isCriteriaMet = true
                : digitCriteriaView.reset()
            
            specialCharMet
                ? specialCharacterCriteriaView.isCriteriaMet = true
                : specialCharacterCriteriaView.reset()
        } else {
            // Focus lost (✅ or ❌)
            lengthCriteriaView.isCriteriaMet = lengthAndNoSpaceMet
            uppercaseCriteriaView.isCriteriaMet = upperCaseMet
            lowerCaseCriteriaView.isCriteriaMet = lowerCaseMet
            digitCriteriaView.isCriteriaMet = digitMet
            specialCharacterCriteriaView.isCriteriaMet = specialCharMet
        }
    }
}
