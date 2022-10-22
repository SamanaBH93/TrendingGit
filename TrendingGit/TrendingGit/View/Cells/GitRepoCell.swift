//
//  GitRepoCell.swift
//  TrendingGit
//
//  Created by VenD-Samana on 16/10/2022.
//

import Foundation
import UIKit

class GitRepoCell: UITableViewCell {
    @IBOutlet private weak var userImageView: UIImageView!
    @IBOutlet private weak var usernameLabel: UILabel!
    @IBOutlet private weak var repoNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userImageView.layer.cornerRadius = userImageView.frame.height/2
    }
    
    override func prepareForReuse() {
        userImageView.image = nil
    }
    
    func populateData(for repo: Repo) {
        usernameLabel.text = repo.owner.username
        repoNameLabel.text = repo.name
        
        ImageStore.getImage(repo.owner.imgUrl, completion: {imgUrl, img in
            DispatchQueue.main.async { [weak self] in
                if imgUrl == repo.owner.imgUrl {
                    self?.userImageView.image = img
                } else {
                    self?.userImageView.image = nil
                }
            }
        })
    }
}
