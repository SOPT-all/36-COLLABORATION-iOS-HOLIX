//
//  SceneDelegate.swift
//  HOLIX_iOS
//
//  Created by 정정욱 on 5/9/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = ClubDetailViewController()
        self.window = window
        window.makeKeyAndVisible()
    }
}
