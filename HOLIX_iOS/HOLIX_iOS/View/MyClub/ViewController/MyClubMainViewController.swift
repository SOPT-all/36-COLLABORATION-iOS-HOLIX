//
//  MyClubViewController.swift
//  HOLIX_iOS
//
//  Created by 쏘 on 5/16/25.
//

import UIKit

class MyClubMainViewController: UIViewController {

    // MARK: - Properties
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let myClub = MyClubView()
    private let recommendedClub = RecommendedClubView()

    // MARK: - UI Components

    private let topTabBar = TopTabBarView(items: ["내 클럽", "클래스", "멘토링"])

    // MARK: - LifeCycle

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        setStyle()
        setLayout()
        fetchClubData()
    }


    // MARK: - Setup

    func setUp() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(topTabBar, myClub, recommendedClub)
    }

    // MARK: - SetStyle

    func setStyle() {
        view.backgroundColor = .white    }

    // MARK: - SetLayout

    func setLayout() {

        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }

        topTabBar.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(40)
        }

        myClub.snp.makeConstraints {
            $0.top.equalTo(topTabBar.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(myClub.calculatedHeight())
        }

        recommendedClub.snp.makeConstraints {
            $0.top.equalTo(myClub.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview()
        }
    }

    // MARK: - FetchData

    private func fetchClubData() {
        Task {
            do {
                let response = try await ClubService.shared.getClub()
                let clubs = response.data.clubs

                self.myClub.updateData(clubs)
                let height = self.myClub.calculatedHeight()
                self.myClub.snp.updateConstraints {
                    $0.height.equalTo(height)
                }
            } catch {
                print("클럽 데이터 불러오기 실패: \(error)")
            }
        }
    }


}

