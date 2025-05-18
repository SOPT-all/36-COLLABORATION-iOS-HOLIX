//
//  SearchCategoryCell.swift
//  HOLIX_iOS
//
//  Created by 정정욱 on 5/18/25.
//

import UIKit

final class SearchCategoryCell: UICollectionViewCell {

    // MARK: - Properties

    static let identifier = SearchCategoryCell.className

    // MARK: - UI Components

    private let menuButton = UIButton()
    private let searchTextField = UITextField()
    private let topTabBar = TopTabBarView(items: ["추천", "강의", "스터디", "북클럽", "멘토링", "커뮤니티"])

    // MARK: - LifeCycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setStyle()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setUI() {
        contentView
            .addSubviews(
                menuButton,
                searchTextField,
                topTabBar
            )
    }

    // MARK: - SetStyle

    private func setStyle() {
        menuButton.do {
            $0.setImage(IconLiterals.ic_hambeger, for: .normal)
        }

        searchTextField.do {
              $0.placeholder = "무엇을 배우고 싶으신가요?"
              $0.layer.cornerRadius = 20
              $0.font = .pretendard(.body3_r_15)
              $0.textColor = .gray03
              $0.returnKeyType = .search
              $0.addLeftPadding(18)
              $0.layer.borderColor = UIColor.gray03.cgColor
              $0.layer.borderWidth = 1
              $0.setRightIcon(IconLiterals.ic_search_gray)
          }
    }

    // MARK: - SetLayout

    private func setLayout() {
        menuButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(14)
            $0.top.equalToSuperview().inset(14)
            $0.width.height.equalTo(24)
        }

        searchTextField.snp.makeConstraints {
            $0.leading.equalTo(menuButton.snp.trailing).offset(29)
            $0.centerY.equalTo(menuButton)
            $0.width.equalTo(300)
            $0.height.equalTo(40)
        }

        topTabBar.snp.makeConstraints {
            $0.top.equalTo(menuButton.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(40)
        }
    }
}
