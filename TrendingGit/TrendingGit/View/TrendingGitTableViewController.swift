//
//  TrendingGitTableViewController.swift
//  TrendingGit
//
//  Created by VenD-Samana on 16/10/2022.
//

import UIKit

class TrendingGitTableViewController: UITableViewController {
    static let identifier = "TrendingGitTableViewController"

    var viewModel: TrendingGitRepoViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "LoadingCell", bundle: .main), forCellReuseIdentifier: "LoadingCell")
        tableView.register(UINib(nibName: "GitRepoCell", bundle: .main), forCellReuseIdentifier: "GitRepoCell")
        viewModel = TrendingGitRepoViewModel(networkService: NetworkService(), delegate: self)
        viewModel.getTrendingGitRepos()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getRowCount()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let repo = viewModel.getData(for: indexPath.row), let cell = tableView.dequeueReusableCell(withIdentifier: "GitRepoCell", for: indexPath) as? GitRepoCell {
            cell.populateData(for: repo)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LoadingCell", for: indexPath)
            return cell
        }
    }
}

extension TrendingGitTableViewController: TrendingGitRepoViewModelDelegate {
    func startLoading() {
        // TODO: - Show Activity indicator
    }
    
    func fetchComplete() {
        tableView.reloadData()
    }
    
    func showError() {
        // TODO: - Show Error Screen
    }
}

