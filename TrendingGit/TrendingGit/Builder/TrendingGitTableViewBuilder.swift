//
//  TrendingGitTableViewBuilder.swift
//  TrendingGit
//
//  Created by VenD-Samana on 25/10/2022.
//

import Foundation
import UIKit

class TrendingGitTableViewBuilder {
    static func build() -> UINavigationController {
        if let vc = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: TrendingGitTableViewController.identifier) as? TrendingGitTableViewController {
            let networkService = NetworkService()
            let vm = TrendingGitRepoViewModel(networkService: networkService, delegate: vc)
            vc.bind(viewModel: vm)
            let nav = UINavigationController(rootViewController: vc)
            return nav
        }
        return UINavigationController()
    }
}
