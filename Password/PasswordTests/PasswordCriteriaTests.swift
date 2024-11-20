//
//  PasswordCriteriaTest.swift
//  PasswordTests
//
//  Created by Sarvar Boltaboyev on 20/11/24.
//

import Foundation
import XCTest

@testable import Password

class PasswordLengthCriteriaTests: XCTestCase {
    var sut: PasswordCriteria!
    var lenghtCrieteriaMet: Bool!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = PasswordCriteria()
        lenghtCrieteriaMet = Bool()
        
    }
    
    override func tearDownWithError() throws {
        sut = nil
        lenghtCrieteriaMet = nil
        try super.tearDownWithError()
    }
    
    func testShort() throws {
        lenghtCrieteriaMet = PasswordCriteria.lenghtCriteriaMet("1234567")
        XCTAssertFalse(lenghtCrieteriaMet)
    }

    func testLong() throws {
        XCTAssertFalse(PasswordCriteria.lenghtCriteriaMet("123456781234567812345678123456783"))
    }
    
    func testValidShort() throws {
        XCTAssertTrue(PasswordCriteria.lenghtCriteriaMet("12345679"))
    }

    func testValidLong() throws {
        XCTAssertTrue(PasswordCriteria.lenghtCriteriaMet("12345671234567"))

    }
}

class PasswordOtherCriteriaTests: XCTestCase {
    func testSpaceMet() throws {
        XCTAssertTrue(PasswordCriteria.noSpacesMet("abc"))
    }
    
    func testSpaceNotMet() throws {
        XCTAssertFalse(PasswordCriteria.noSpacesMet("a bc"))
    }
    
    func testlengthAnsNoSpaceNotMet() {
        XCTAssertFalse(PasswordCriteria.lengthAnsNoSpace("12345 678"))
    }
    
    func testupperCaseMet() {
        XCTAssertTrue(PasswordCriteria.upperCaseMet("akklJJa"))
    }
    
    func testlowercaseMet() {
        XCTAssertTrue(PasswordCriteria.lowercaseMet("dsd"))
    }
    
    func testdigitMet() {
        XCTAssertTrue(PasswordCriteria.digitMet("fhan23"))
    }
    
    func testspecialCharMet() {
        XCTAssertTrue(PasswordCriteria.specialCharMet("fvek84#j"))
    }
}


