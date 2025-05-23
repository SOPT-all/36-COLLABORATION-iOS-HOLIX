//
//  NoticeButton.swift
//  HOLIX_iOS
//
//  Created by 임재현 on 5/16/25.
//

import UIKit

import SnapKit
import Then

final class NoticeButton: UIButton {

    // MARK: - UI Components

    private let iconImageView = UIImageView()
    var textLabel = UILabel()
    private let chevronImageView = UIImageView()

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

    // MARK: - SetUI

    private func setUI() {
        self.addSubviews(
            iconImageView,
            textLabel,
            chevronImageView
        )
    }

    // MARK: - SetStyle

    private func setStyle() {

        iconImageView.do {
            $0.contentMode = .scaleAspectFit
            $0.image = UIImage(named: "ic_speaker_ios")
        }

        textLabel.do {
            $0.font = .pretendard(.body6_m_13)
            $0.textColor = .label
            $0.text = "입장후 간단하게 자기소개를 포함한 인사를 부탁드립니다 하하하하하"
        }

        chevronImageView.do {
            $0.contentMode = .scaleAspectFit
            $0.image = UIImage(systemName: "chevron.right")
            $0.tintColor = .systemGray
        }

        self.backgroundColor = .secondarySystemBackground
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
    }

    // MARK: - SetLayout

    private func setLayout() {
        iconImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(12)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(20)
        }

        chevronImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(12)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(16)
        }

        textLabel.snp.makeConstraints {
            $0.leading.equalTo(iconImageView.snp.trailing).offset(8)
            $0.trailing.lessThanOrEqualTo(chevronImageView.snp.leading).offset(-8)
            $0.centerY.equalToSuperview()
        }
    }
}
