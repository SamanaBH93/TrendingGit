//
//  TrendingGitTableViewControllerTests.swift
//  TrendingGitTests
//
//  Created by VenD-Samana on 26/10/2022.
//

import XCTest
@testable import TrendingGit

final class TrendingGitTableViewControllerTests: XCTestCase {
    var sut: TrendingGitTableViewController!
    var vm: TrendingGitViewModelMock!

    override func setUpWithError() throws {
        sut = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "TrendingGitTableViewController") as? TrendingGitTableViewController
        vm = TrendingGitViewModelMock()
        vm.delegate = sut
        sut.bind(viewModel: vm)
    }

    func testErrorScreen() throws {
        vm.delegate.showError()
        XCTAssertNotNil(sut.failureView.superview)
    }
    
    func testTitle() {
        XCTAssertEqual(sut.title, "Trending")
    }


    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

class TrendingGitViewModelMock: TrendingGitRepoViewModelProtocol {
    weak var delegate: TrendingGitRepoViewModelDelegate!
    func getTrendingGitRepos() {
    }

    func getRowCount() -> Int {
        return 10
    }

    func getData(for row: Int) -> TrendingGit.GitRepoCellViewModel? {
        return nil
    }


}
