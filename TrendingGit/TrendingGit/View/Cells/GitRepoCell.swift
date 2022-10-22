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
}
