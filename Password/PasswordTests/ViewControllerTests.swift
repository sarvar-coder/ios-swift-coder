//
//  ViewControllerTests.swift
//  PasswordTests
//
//  Created by Sarvar Boltaboyev on 20/11/24.
//

import Foundation
import XCTest

@testable import Password

class ViewControllerTests_NewPassword_Validation: XCTestCase {

    var vc: ViewController!
    let validPassword = "12345678Aa!"
    let tooShort = "1234Aa!"
    
    override func setUp() {
        super.setUp()
        vc = ViewController()
    }

    /*
     Here we trigger those criteria blocks by entering text,
     clicking the reset password button, and then checking
     the error label text for the right message.
     */
    
    func testEmptyPassword() throws {
        vc.passwordTextField.text = ""
        vc.resetPasswordButtonTapped(sender: UIButton())
        
        XCTAssertEqual(vc.passwordTextField.errorLabel.text!, "Enter your password")
    }
    
    func testInvalidPassword() throws {
        vc.passwordTextField.text = " "
        vc.resetPasswordButtonTapped(sender: UIButton())
        
        XCTAssertEqual(vc.passwordTextField.errorLabel.text!, "Enter valid special chars (.,@:?!()$\\/#) with no spaces")
    }

    func testCriteriaNotMet() throws {
        vc.passwordTextField.text = "qwerty"
        vc.resetPasswordButtonTapped(sender: UIButton())
        
        XCTAssertEqual(vc.passwordTextField.errorLabel.text!, "Your password must meet the requirements below")
    }

    func testValidPassword() throws {
        vc.passwordTextField.text = "qwerty1@A"
        vc.resetPasswordButtonTapped(sender: UIButton())
        
        XCTAssertEqual(vc.passwordTextField.errorLabel.text!, "")
    }
}

class ViewControllerTests_Confirm_Password_Validation: XCTestCase {

    var vc: ViewController!
    let validPassword = "12345678Aa!"
    let tooShort = "1234Aa!"
    
    override func setUp() {
        super.setUp()
        vc = ViewController()
    }
    
    func testEmptyPassword() throws {
        vc.confirmPasswordTextField.text = ""
        vc.resetPasswordButtonTapped(sender: UIButton())
        
        XCTAssertEqual(vc.confirmPasswordTextField.errorLabel.text!, "Enter your password.")
    }
    
    func testPasswordNotMatch() {
        vc.passwordTextField.text = "12345678Aa!"
        vc.confirmPasswordTextField.text = "12345678Aa@"
        
        vc.resetPasswordButtonTapped(sender: UIButton())
        
        XCTAssertEqual(vc.confirmPasswordTextField.errorLabel.text!, "Passwords do not match.")
    }
    
    func testPasswordMatch() {
        vc.passwordTextField.text = "12345678Aa!"
        vc.confirmPasswordTextField.text = "12345678Aa!"
        
        vc.resetPasswordButtonTapped(sender: UIButton())
        
        XCTAssertEqual(vc.confirmPasswordTextField.errorLabel.text!, "")
    }
}

class ViewControllerTests_Show_Alert: XCTestCase {

    var vc: ViewController!
    let validPassword = "12345678Aa!"
    let tooShort = "1234Aa!"
    
    override func setUp() {
        super.setUp()
        vc = ViewController()
    }
    
    func testShowSuccess() throws {
        vc.passwordTextField.text = validPassword
        vc.confirmPasswordTextField.text = validPassword
        vc.resetPasswordButtonTapped(sender: UIButton())

        XCTAssertNotNil(vc.alert)
    }

    func testShowError() throws {
        vc.passwordTextField.text = validPassword
        vc.confirmPasswordTextField.text = tooShort
        vc.resetPasswordButtonTapped(sender: UIButton())

        XCTAssertNil(vc.alert)
    }
}
