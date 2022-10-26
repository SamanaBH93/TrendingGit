//
//  TrendingGitRepoViewModel.swift
//  TrendingGit
//
//  Created by VenD-Samana on 17/10/2022.
//

import Foundation

protocol TrendingGitRepoViewModelProtocol {
    func getTrendingGitRepos()
    func getRowCount() -> Int
    func getData(for row: Int) -> GitRepoCellViewModel?
}

protocol TrendingGitRepoViewModelDelegate: AnyObject {
    func fetchComplete()
    func showError()
}

class TrendingGitRepoViewModel: TrendingGitRepoViewModelProtocol {
    
    private let networkService: NetworkServiceProtocol
    private weak var delegate: TrendingGitRepoViewModelDelegate!
    
    private var repos: [GitRepoCellViewModel] = []
    
    init(networkService: NetworkServiceProtocol, delegate: TrendingGitRepoViewModelDelegate) {
        self.networkService = networkService
        self.delegate = delegate
    }
    
    func getTrendingGitRepos() {
        let url = "https://api.github.com/search/repositories?q=language=+sort:stars"
        
        networkService.request(url: url) { [weak self] response in
            DispatchQueue.main.async {
                switch response {
                case .success(let result):
                    self?.repos = result.items.map { GitRepoCellViewModel(repoName: $0.name, description: $0.description, ownerName: $0.owner.username, ownerImageUrl: $0.owner.imgUrl, language: $0.language ?? "", starCount: $0.stargazers_count) }
                    self?.delegate.fetchComplete()
                case .failure:
                    //do something
                    self?.delegate.showError()
                }
            }
        }
    }
    
    func getRowCount() -> Int {
        repos.isEmpty ? 10 : repos.count
        // Keeping 10 to show empty cells
    }
    
    func getData(for row: Int) -> GitRepoCellViewModel? {
        guard row < repos.count else {
            return nil
        }
        
        return repos[row]
    }
}
