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
    @IBOutlet private weak var repoDescLabel: UILabel!
    @IBOutlet private weak var languageImageView: UIImageView!
    @IBOutlet private weak var languageLabel: UILabel!
    @IBOutlet private weak var starImageView: UIImageView!
    @IBOutlet private weak var starlabelLabel: UILabel!
    @IBOutlet private weak var extrasContainerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userImageView.layer.cornerRadius = userImageView.frame.height/2
    }
    
    override func prepareForReuse() {
        userImageView.image = nil
    }
    
    func showDetails(show: Bool) {
        repoDescLabel.isHidden = !show
        extrasContainerView.isHidden = !show
    }
    
    func populateData(for repo: GitRepoCellViewModel) {
        usernameLabel.text = repo.ownerName
        repoNameLabel.text = repo.repoName
        repoDescLabel.text = repo.description
        languageLabel.text = repo.language
        starlabelLabel.text = "\(repo.starCount)"
        
        showDetails(show: !repo.isDetailHidden)
        
        ImageStore.getImage(repo.ownerImageUrl, completion: {imgUrl, img in
            DispatchQueue.main.async { [weak self] in
                if imgUrl == repo.ownerImageUrl {
                    self?.userImageView.image = img
                } else {
                    self?.userImageView.image = nil
                }
            }
        })
    }
}
