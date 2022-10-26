//
//  NetworkServiceTests.swift
//  TrendingGitTests
//
//  Created by VenD-Samana on 26/10/2022.
//

import XCTest
@testable import TrendingGit

final class NetworkServiceTests: XCTestCase {
    var sut: NetworkService!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = NetworkService()
    }

    func testRequest() {
        let promise = expectation(description: "Request passed")
        let url = "https://api.github.com/search/repositories?q=language=+sort:stars"
        sut.request(url: url) { result in
            if case .failure = result {
                XCTFail("Request failed")
            }
            
            promise.fulfill()
        }
        
        waitForExpectations(timeout: 5)
    }
    
    func testIncorrectURL() {
        let promise = expectation(description: "Request failed successfully")
        let url = "https://api.github.com/123"
        sut.request(url: url) { result in
            if case .failure = result {
                promise.fulfill()
            }
        }
        
        waitForExpectations(timeout: 5)
    }

}
