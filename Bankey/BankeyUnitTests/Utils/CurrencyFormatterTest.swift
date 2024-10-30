//
//  CurrencyFormatterTest.swift
//  BankeyUnitTests
//
//  Created by Sarvar Boltaboyev on 29/10/24.
//

import Foundation
import XCTest

@testable import Bankey

class Test: XCTestCase {
    var formatter: CurrencyFormatter!
    
    
    override  func setUp() {
        super.setUp()
        formatter = CurrencyFormatter()
        
        
         
    }
    
    func testBreakDollarsIntoCents() throws {
            let result = formatter.breakIntoDollarsAndCents(929466.23)
            XCTAssertEqual(result.0, "929,466")
            XCTAssertEqual(result.1, "23")
        }
    
    
    func testDollarsFormatted() {
        let result = formatter.dollarsFormatted(45.66)
        XCTAssertEqual(result, "$45.66")
    }
    
    func testZeroDollarsFormatted() {
        let result = formatter.dollarsFormatted(0)
        XCTAssertEqual(result, "$0.00")

    }
    
}
