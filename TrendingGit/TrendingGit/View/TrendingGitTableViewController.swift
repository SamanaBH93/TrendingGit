//
//  TrendingGitTableViewController.swift
//  TrendingGit
//
//  Created by VenD-Samana on 16/10/2022.
//

import UIKit

class TrendingGitTableViewController: UITableViewController {
    static let identifier = "TrendingGitTableViewController"
    typealias ViewModel = TrendingGitRepoViewModelProtocol

    private var viewModel: ViewModel!
    
    @IBOutlet weak var failureView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var retryButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
        viewModel.getTrendingGitRepos()
    }
    
    private func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 70
        tableView.register(UINib(nibName: "LoadingCell", bundle: .main), forCellReuseIdentifier: "LoadingCell")
        tableView.register(UINib(nibName: "GitRepoCell", bundle: .main), forCellReuseIdentifier: "GitRepoCell")
    }
    
    func bind(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let repo = viewModel.getData(for: indexPath.row) {
            repo.isDetailHidden = !repo.isDetailHidden
            tableView.reloadRows(at: [indexPath], with: .automatic)
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
        failureView.frame = tableView.bounds
        tableView.addSubview(failureView)
        retryButton.layer.borderWidth = 1
        retryButton.layer.borderColor = UIColor.green.cgColor
        retryButton.tintColor = UIColor.green
        retryButton.addTarget(self, action: #selector(retryTapped(_:)), for: .touchUpInside)
        let gif = UIImage.gifImageWithName("retry")
        imageView.image = gif
        retryButton.layer.cornerRadius = 5
        
    }
    
    @objc private func retryTapped(_ sender: Any) {
        failureView.removeFromSuperview()
        viewModel.getTrendingGitRepos()
    }
}

