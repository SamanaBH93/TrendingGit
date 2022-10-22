//
//  GetGitRepoRequest.swift
//  TrendingGit
//
//  Created by VenD-Samana on 17/10/2022.
//

import Foundation

struct GetGitRepoResponse: Decodable {
    var items: [Repo]
}

struct Owner: Decodable {
    var username: String
    var imgUrl: String
    
    enum CodingKeys: String, CodingKey {
        case username = "login"
        case imgUrl = "avatar_url"
    }
}

struct Repo: Decodable {
    var name: String
    var description: String
    var language: String?
    var stargazers_count: Int
    var owner: Owner
    
    
}
