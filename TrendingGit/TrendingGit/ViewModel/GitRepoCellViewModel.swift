//
//  GitRepoCellViewModel.swift
//  TrendingGit
//
//  Created by VenD-Samana on 23/10/2022.
//

import Foundation

class GitRepoCellViewModel {
    var repoName: String
    var description: String
    var ownerName: String
    var ownerImageUrl: String
    var language: String
    var starCount: Int
    var isDetailHidden: Bool = true
    
    init(repoName: String,
         description: String,
         ownerName: String,
         ownerImageUrl: String,
         language: String,
         starCount: Int) {
        self.repoName = repoName
        self.description = description
        self.ownerName = ownerName
        self.ownerImageUrl = ownerImageUrl
        self.language = language
        self.starCount = starCount
    }
}
