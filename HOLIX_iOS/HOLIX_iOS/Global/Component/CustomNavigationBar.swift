//
//  CustomNavigationBar.swift
//  HOLIX_iOS
//
//  Created by 임재현 on 5/14/25.
//

import UIKit

import SnapKit
import Then

protocol CustomNavigationBarDelegate: AnyObject {
    func didTapBackButton()
    func didTapSearchButton()
    func didTapMenuButton()
}

final class CustomNavigationBar: UIView {

    // MARK: - Properties

    private var hasMenuButton: Bool = false
    weak var delegate: CustomNavigationBarDelegate?

    // MARK: - UI Components

    private let backButton = UIButton()
    private let titleLabel = UILabel()
    private let searchButton = UIButton()
    private let menuButton = UIButton()
    private let buttonStackView = UIStackView()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(titleLabel: String = "", hasMenuButton: Bool) {
        super.init(frame: .zero)
        self.hasMenuButton = hasMenuButton
        self.titleLabel.text = titleLabel
        setUI()
        setStyle()
        setLayout()
        setAddTarget()
    }

    // MARK: - SetUI

    private func setUI() {
        [backButton,titleLabel,buttonStackView].forEach {
            self.addSubview($0)
        }

        self.buttonStackView.addArrangedSubview(searchButton)

        if hasMenuButton {
            self.buttonStackView.addArrangedSubview(menuButton)
            menuButton.snp.makeConstraints {
                $0.size.equalTo(30)
            }
        }
    }

    // MARK: - SetStyle

    private func setStyle() {
        self.backgroundColor = .white

        backButton.do {
            $0.setImage(UIImage(systemName: "chevron.left"), for: .normal)
            $0.tintColor = .black
        }

        titleLabel.do {
            $0.textColor = .black
            $0.font = .pretendard(size: 16)
        }

        searchButton.do {
            $0.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
            $0.tintColor = .black
        }

        menuButton.do {
            $0.setImage(UIImage(systemName: "line.3.horizontal"), for: .normal)
            $0.tintColor = .black
        }

        buttonStackView.do {
            $0.axis = .horizontal
            $0.distribution = .fillEqually
            $0.spacing = 5
        }
    }

    // MARK: - SetLayout

    private func setLayout() {
        backButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.size.equalTo(20)
            $0.centerY.equalToSuperview()
        }

        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(self.backButton.snp.trailing).offset(16)
            $0.centerY.equalToSuperview()
        }

        buttonStackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(20)
        }

        searchButton.snp.makeConstraints {
            $0.size.equalTo(30)
        }
    }

    // MARK: - SetAddTarget

    private func setAddTarget() {
        backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
        searchButton.addTarget(self, action: #selector(searchButtonDidTap), for: .touchUpInside)
        menuButton.addTarget(self, action: #selector(menuButtonDidTap), for: .touchUpInside)

    }

    // MARK: - Button Actions

    @objc private func backButtonDidTap() {
        print("backButton 클릭됨")
        delegate?.didTapBackButton()
    }

    @objc private func searchButtonDidTap() {
        print("searchButton 클릭됨")
        delegate?.didTapSearchButton()
    }

    @objc private func menuButtonDidTap() {
        print("menuButton 클릭됨")
        delegate?.didTapMenuButton()
    }
}
