//
//  SearchBarHeaderView.swift
//  HOLIX_iOS
//
//  Created by 정정욱 on 5/20/25.
//

import UIKit

import SnapKit
import Then

final class SearchBarHeaderView: UIView {

    // MARK: - UI Components

    private let menuButton = UIButton()
    private let searchTextField = UITextField()

    // MARK: - LifeCycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        setStyle()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setUp() {
        addSubviews(
            menuButton,
            searchTextField
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
            $0.trailing.equalToSuperview().inset(46)
            $0.height.equalTo(40)
        }
    }
}
