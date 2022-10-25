//
//  TrendingGitTests.swift
//  TrendingGitTests
//
//  Created by VenD-Samana on 16/10/2022.
//

import XCTest
@testable import TrendingGit

final class TrendingGitRepoViewModelTests: XCTestCase, TrendingGitRepoViewModelDelegate {
    
    var viewModel: TrendingGitRepoViewModel!
    var expectation: XCTestExpectation!

    override func setUpWithError() throws {
        try super.setUpWithError()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = TrendingGitRepoViewModel(networkService: NetworkServiceMock(isSuccess: true), delegate: self)
        
    }

    func testGetTrendingGetRepoSuccess() {
        viewModel.getTrendingGitRepos()
        expectation = expectation(description: "fetchCompleteCalled")
        waitForExpectations(timeout: 5,handler: nil)
        XCTAssertNotEqual(viewModel.getRowCount(), 0)
    }
    
    func testGetTrendingGitRepoFailure() {
        viewModel = TrendingGitRepoViewModel(networkService: NetworkServiceMock(isSuccess: false), delegate: self)
        viewModel.getTrendingGitRepos()
        
        expectation = expectation(description: "showErrorCalled")
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNil(viewModel.getData(for: 0))
    }
    
    func testGetRowCount() {
        viewModel.getTrendingGitRepos()
        expectation = expectation(description: "fetchCompleteCalled")
        waitForExpectations(timeout: 5,handler: nil)
        XCTAssertEqual(viewModel.getRowCount(), 6)
    }
    
    func testGetData() {
        viewModel.getTrendingGitRepos()
        expectation = expectation(description: "fetchCompleteCalled")
        waitForExpectations(timeout: 5,handler: nil)
        let firstRowData = viewModel.getData(for: 0)
        let testData = GitRepoCellViewModel(repoName: "Repo0", description: "Some description about repo", ownerName: "TestUser0", ownerImageUrl: "someImageUrl.com", language: "swift", starCount: 345)
        XCTAssertEqual(firstRowData?.repoName, testData.repoName)
        XCTAssertEqual(firstRowData?.description, testData.description)
        XCTAssertEqual(firstRowData?.language, testData.language)
        XCTAssertEqual(firstRowData?.ownerName, testData.ownerName)
        XCTAssertEqual(firstRowData?.ownerImageUrl, testData.ownerImageUrl)
        XCTAssertEqual(firstRowData?.starCount, testData.starCount)
    }
    
    
    func startLoading() {
        expectation.fulfill()
    }
    
    func fetchComplete() {
        expectation.fulfill()
    }
    
    func showError() {
        expectation.fulfill()
    }
}

class NetworkServiceMock: NetworkServiceProtocol {
    var isSuccess = true
    
    init(isSuccess: Bool) {
        self.isSuccess = isSuccess
    }
    
    func request(url: String, completion: @escaping (TrendingGit.Result<TrendingGit.GetGitRepoResponse>) -> Void) {
        if isSuccess {
            let getGitRepoResponse = GetGitRepoResponse(items: getResponseItems())
            completion(.success(getGitRepoResponse))
        } else {
            completion(.failure)
        }
    }
    
    func getResponseItems() -> [Repo] {
        var result: [Repo] = []
        
        for i in 0...5 {
            result.append(Repo(name: "Repo\(i)", description: "Some description about repo", language: "swift", stargazers_count: 345, owner: Owner(username: "TestUser\(i)", imgUrl: "someImageUrl.com")))
        }
        
        return result
    }
}
