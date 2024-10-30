//
//  ProfileTest.swift
//  BankeyUnitTests
//
//  Created by Sarvar Boltaboyev on 30/10/24.
//

import Foundation
import XCTest

@testable import Bankey

class ProfileTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testCanParse() {
        
        let json = """
                {
                "id": "1",
                "first_name": "Kevin",
                "last_name": "Flynn",
                }
                """
        
        let data = json.data(using: .utf8)!
        let result = try! JSONDecoder().decode(Profile.self, from: data)
        
        XCTAssertEqual(result.id, "1")
        XCTAssertEqual(result.firstName, "Kevin")
        XCTAssertEqual(result.lastName, "Flynn")
    }
    
    func testCanParseAccount() throws {
           let json = """
            [
              {
                "id": "1",
                "type": "Banking",
                "name": "Basic Savings",
                "amount": 929466.23,
                "createdDateTime" : "2010-06-21T15:29:32Z"
              },
              {
                "id": "2",
                "type": "Banking",
                "name": "No-Fee All-In Chequing",
                "amount": 17562.44,
                "createdDateTime" : "2011-06-21T15:29:32Z"
              },
             ]
           """

           // Game on here 🕹
        
        let data = json.data(using: .utf8)!
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let accounts = try! decoder.decode([Account].self, from: data)
        
        XCTAssertEqual(accounts[0].id, "1")
        XCTAssertEqual(accounts[0].amount, 929466.23)
        XCTAssertEqual(accounts[0].type, AccountType.Banking)
        XCTAssertEqual(accounts[0].name, "Basic Savings")
       }
}
