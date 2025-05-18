//
//  MyClubViewController.swift
//  HOLIX_iOS
//
//  Created by 쏘 on 5/16/25.
//

import UIKit

class MyClubMainViewController: UIViewController {

    // MARK: - Properties
    private let myClub = MyClubView()
    private let recommendedClub = RecommendedClubView()

    // MARK: - UI Components

    private let topTabBar = TopTabBarView(items: ["내 클럽", "클래스", "멘토링"])

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        setStyle()
        setLayout()
    }

    // MARK: - Setup

    func setUp() {
        view.addSubviews(topTabBar, myClub, recommendedClub)
    }

    // MARK: - SetStyle

    func setStyle() {
        view.backgroundColor = .white
    }

    // MARK: - SetLayout

    func setLayout() {
        topTabBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(40)
        }
        myClub.snp.makeConstraints {
            $0.top.equalTo(topTabBar.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(364)
        }
        recommendedClub.snp.makeConstraints {
            $0.top.equalTo(myClub.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
