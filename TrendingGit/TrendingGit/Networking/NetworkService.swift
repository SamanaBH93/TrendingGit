//
//  NetworkService.swift
//  TrendingGit
//
//  Created by VenD-Samana on 17/10/2022.
//

import Foundation

enum Result<T>  {
    case success(T)
    case failure
}

protocol NetworkServiceProtocol {
    func request(url: String, completion: @escaping (Result<GetGitRepoResponse>) -> Void)
}


final class NetworkService: NetworkServiceProtocol {
  
  
  func request(url: String, completion: @escaping (Result<GetGitRepoResponse>) -> Void) {
      guard let url = URL(string: url) else {
          completion(.failure)
          return
      }
      
      DispatchQueue.global().async {
          let task = URLSession.shared.dataTask(with: url) { data, response, error in

              guard let httpResponse = response as? HTTPURLResponse,
                        httpResponse.statusCode == 200,
                    let data else {
                  completion(.failure)
                  return
              }
              
              do {
                  let genericModel = try JSONDecoder().decode(GetGitRepoResponse.self, from: data)
                  completion(.success(genericModel))
              } catch {
                  completion(.failure)
              }
          }
          task.resume()
      }
  }
}
