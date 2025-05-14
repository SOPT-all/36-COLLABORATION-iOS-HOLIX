//
//  HomeViewController.swift
//  HOLIX_iOS
//
//  Created by 정정욱 on 5/14/25.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - UI Components

    private let topTabBar = TopTabBarView(items: ["추천", "강의", "스터디", "북클럽", "멘토링", "커뮤니티"])

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        setStyle()
        setLayout()
    }

    // MARK: - Setup

    func setUp() {
        view.addSubview(topTabBar)
    }

    // MARK: - SetStyle

    func setStyle() {

    }

    // MARK: - SetLayout

    func setLayout() {
        topTabBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(40)
        }
    }
}
