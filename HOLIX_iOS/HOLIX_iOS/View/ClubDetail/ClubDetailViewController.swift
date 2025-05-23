//
//  ClubDetailViewController.swift
//  HOLIX_iOS
//
//  Created by 임재현 on 5/15/25.
//

import UIKit

import Kingfisher
import SnapKit
import Then

final class ClubDetailViewController: UIViewController {

    // MARK: - UI Components
    private let customNavigationBar = CustomNavigationBar(hasMenuButton: false)
    private let iconImageView = UIImageView()
    private let clubInfoView = ClubInfoView()

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setStyle()
        setLayout()
        loadClubInfo(clubId: "3")
    }

    // MARK: - SetUI

    private func setUI() {
        self.view.addSubviews(customNavigationBar,iconImageView,clubInfoView)
        customNavigationBar.layer.zPosition = 1

    }

    // MARK: - SetStyle

    private func setStyle() {
        self.view.backgroundColor = .clubHomeBackground

        iconImageView.do {
            $0.image = UIImage(named: "img_1_ios")
            $0.contentMode = .scaleAspectFill
            $0.backgroundColor = .clubHomeBackground
        }

        customNavigationBar.do {
            $0.backgroundColor = .clear
            $0.tintColor = .white
        }

        clubInfoView.do {
            $0.layer.cornerRadius = 20
            $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            $0.layer.masksToBounds = true
        }
    }

    // MARK: - SetLayout

    private func setLayout() {
        customNavigationBar.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }

        iconImageView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(view.snp.height).multipliedBy(0.25)
        }

        clubInfoView.snp.makeConstraints {
            $0.top.equalTo(iconImageView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}


extension ClubDetailViewController {
    
    func fetchClubDetail(clubId: String) async throws -> ClubDetailResponse? {
        do {
            let detail = try await ClubChattingService.shared.getClubDetail(clubId: clubId)
            print("클럽 정보 조회 성공: \(detail)")
            return detail
        } catch {
            print("클럽 정보 조회 실패: \(error)")
            return nil
        }
    }
    
    func loadClubInfo(clubId: String) {
        Task {
            do {
                guard let detail = try await fetchClubDetail(clubId: clubId) else {
                    print("클럽 정보가 없습니다")
                    return
                }
                updateUI(with: detail)
            } catch {
                print("에러: \(error)")
            }
        }
    }

    
    func updateUI(with detail: ClubDetailResponse) {
        clubInfoView.configure(with: detail)
        if let url = URL(string: detail.data.url) {
            iconImageView.kf.setImage(with: url)
        }
    }
}
