//
//  SceneDelegate.swift
//  SettingsMVC
//
//  Created by Daniil Yarkovenko on 02.07.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)

        //root controller
        let vc = TableViewController()
        let navController = UINavigationController(rootViewController: vc)
        
        //navController configs
        navController.navigationBar.prefersLargeTitles = true
        
        window.rootViewController = navController
        window.makeKeyAndVisible()
        self.window = window
    }
}

