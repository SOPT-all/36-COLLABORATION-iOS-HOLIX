//
//  MainTabBarController.swift
//  HOLIX_iOS
//
//  Created by 정정욱 on 5/13/25.
//

import UIKit

final class MainTabBarController: UITabBarController {

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupTabBarAppearance()
        setupViewControllers()
    }

    // MARK: - Setup

    private func setupTabBar() {
        tabBar.backgroundColor = .white
        tabBar.isTranslucent = false
    }

    private func setupTabBarAppearance() {
        let appearance = UITabBarItem.appearance()

        appearance.setTitleTextAttributes([
            .font: UIFont.pretendard(.label3_r_11),
            .foregroundColor: UIColor.gray04
        ], for: .normal)

        appearance.setTitleTextAttributes([
            .font: UIFont.pretendard(.label3_r_11),
            .foregroundColor: UIColor.main_blue
        ], for: .selected)
    }

    private func setupViewControllers() {
        let homeVC = HomeViewController()
        homeVC.tabBarItem = UITabBarItem(
            title: "홈",
            image: IconLiterals.ic_home.withRenderingMode(.alwaysOriginal),
            selectedImage: IconLiterals.ic_home_active.withRenderingMode(.alwaysOriginal)
        )

        let clubVC = MyClubMainViewController()
        clubVC.tabBarItem = UITabBarItem(
            title: "내 클럽",
            image: IconLiterals.ic_my.withRenderingMode(.alwaysOriginal),
            selectedImage: IconLiterals.ic_my_active.withRenderingMode(.alwaysOriginal)
        )

        let notificationVC = ViewController()
        notificationVC.tabBarItem = UITabBarItem(
            title: "알림",
            image: IconLiterals.ic_alert.withRenderingMode(.alwaysOriginal),
            selectedImage: IconLiterals.ic_alert_active.withRenderingMode(.alwaysOriginal)
        )

        let profileVC = ViewController()
        profileVC.tabBarItem = UITabBarItem(
            title: "프로필",
            image: IconLiterals.ic_profile.withRenderingMode(.alwaysOriginal),
            selectedImage: IconLiterals.ic_profile_active.withRenderingMode(.alwaysOriginal)
        )

        self.viewControllers = [
            UINavigationController(rootViewController: homeVC),
            UINavigationController(rootViewController: clubVC),
            UINavigationController(rootViewController: notificationVC),
            UINavigationController(rootViewController: profileVC)
        ]
    }
}
