//
//  R_DProjectTests.swift
//  R&DProjectTests
//
//  Created by ashish on 15/02/23.
//

import XCTest
@testable import R_DProject

class R_DProjectTests: XCTestCase {
    
    func testAdd_Twoo_Value() {
        let vc = ViewController()
        let result = vc.calculateTwoValue(10, 20)
        XCTAssertEqual(result, 30)
        
    }


    func testCheckSdkKey() {
        let key = Utitlity.instance.sdkKey
        XCTAssert(key != nil && !(key?.isEmpty ?? true))
    }
    
    func testAddition() {
        let result = Utitlity.instance.addToNumbers(first: 4, second: 6)
        print(result)
        XCTAssertEqual(result, 15)
    
    }
//
//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
