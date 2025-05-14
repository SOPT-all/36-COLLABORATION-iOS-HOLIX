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
    /// 추후 소은이 Font 리팩토링 끝나면 setupTabBarAppearance 수정 해야함

    private func setupTabBar() {
        tabBar.backgroundColor = .white
        tabBar.isTranslucent = false
    }

    private func setupTabBarAppearance() {
        let appearance = UITabBarItem.appearance()

        appearance.setTitleTextAttributes([
            .font: UIFont.pretendard(size: 11, weight: .Bold),
            .foregroundColor: UIColor.gray
        ], for: .normal)

        appearance.setTitleTextAttributes([
            .font: UIFont.pretendard(size: 11, weight: .Bold),
            .foregroundColor: UIColor.systemBlue
        ], for: .selected)
    }

    private func setupViewControllers() {
        let homeVC = HomeViewController()
        homeVC.tabBarItem = UITabBarItem(
            title: "홈",
            image: IconLiterals.ic_home.withRenderingMode(.alwaysOriginal),
            selectedImage: IconLiterals.ic_home_active.withRenderingMode(.alwaysOriginal)
        )

        let clubVC = ViewController()
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
