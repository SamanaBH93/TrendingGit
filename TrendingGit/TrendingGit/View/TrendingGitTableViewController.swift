//
//  TrendingGitTableViewController.swift
//  TrendingGit
//
//  Created by VenD-Samana on 16/10/2022.
//

import UIKit

class TrendingGitTableViewController: UITableViewController {
    static let identifier = "TrendingGitTableViewController"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "LoadingCell", bundle: .main), forCellReuseIdentifier: "LoadingCell")
        tableView.register(UINib(nibName: "GitRepoCell", bundle: .main), forCellReuseIdentifier: "GitRepoCell")
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LoadingCell", for: indexPath)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "GitRepoCell", for: indexPath)
            return cell
        }
       
    }
}

