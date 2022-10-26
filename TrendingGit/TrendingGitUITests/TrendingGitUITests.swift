//
//  TrendingGitUITests.swift
//  TrendingGitUITests
//
//  Created by VenD-Samana on 16/10/2022.
//

import XCTest

final class TrendingGitUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testHappyFlow() throws {
        let app = XCUIApplication()
        let tableView = app.tables.firstMatch
        let loadingCell = tableView.cells["LoadingCell"]
        let gitRepoCell = tableView.cells["GitRepoCell"]
        app.launch()
        XCTAssert(loadingCell.waitForExistence(timeout: 5))
        XCTAssert(gitRepoCell.waitForExistence(timeout: 5))
        
        let firstCell = tableView.cells["GitRepoCell"].firstMatch
        let detailsView = firstCell.images["StarImageView"]
        firstCell.tap()
        XCTAssert(detailsView.waitForExistence(timeout: 5))
        firstCell.tap()
        XCTAssertFalse(detailsView.exists)
        tableView.swipeDown()
        XCTAssert(gitRepoCell.exists)
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
