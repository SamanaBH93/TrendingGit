//
//  SceneDelegate.swift
//  TrendingGit
//
//  Created by VenD-Samana on 16/10/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let nav = TrendingGitTableViewBuilder.build()
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
    }
}
