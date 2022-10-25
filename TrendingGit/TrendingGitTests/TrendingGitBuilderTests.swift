//
//  TrendingGitBuilderTests.swift
//  TrendingGitTests
//
//  Created by VenD-Samana on 25/10/2022.
//

import XCTest
@testable import TrendingGit

final class TrendingGitBuilderTests: XCTestCase {

    func testBuild() {
        let nav = TrendingGitTableViewControllerBuilder.build()
        XCTAssert(nav.topViewController is TrendingGitTableViewController)
    }
}
