//
//  ParserViewModelTests.swift
//  ParserTests
//
//  Created by mnameit on 22/02/22.
//

import XCTest

class ParserViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testgetData()  {
        let expectation = self.expectation(description: "3")
        let viewModel = ParserVieModel()
        viewModel.update = { [weak self] in
            viewModel.parserArray.bind(listener: {arrayObj in
                if arrayObj.count==3 {
                    expectation.fulfill()
                }
            })
           }
        
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
            viewModel.getData()
        })
        waitForExpectations(timeout: 8, handler: nil)
    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
