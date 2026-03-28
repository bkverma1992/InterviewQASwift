//
//  UnitTest.swift
//  R&DProjectTests
//
//  Created by APPLE on 15/09/25.
//

import XCTest
@testable import R_DProject

final class UnitTest: XCTestCase {

    func testAdd_Twoo_Value() {
        let vc = ViewController()
        let result = vc.calculateTwoValue(10, 20)
        XCTAssertEqual(result, 30)
        
    }

}
