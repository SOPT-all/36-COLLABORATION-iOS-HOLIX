//
//  RecommendedClubCell.swift
//  HOLIX_iOS
//
//  Created by 쏘 on 5/16/25.
//

import UIKit

import SnapKit
import Then

final class RecommendedClubCell: UITableViewCell {

    // MARK: - Properties

    static let identifier = RecommendedClubCell.className

    // MARK: - UI Components

    let thumbnail = UIImageView()
    let titleLabel = UILabel()
    let hostLabel = UILabel()
    let memberLabel = UILabel()
    let statusLabel = UILabel()

    // MARK: - LifeCycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setUI()
        setStyle()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - SetUI

    private func setUI() {
        contentView.addSubviews(thumbnail, titleLabel, hostLabel, memberLabel, statusLabel)
    }

    // MARK: - SetStyle

    private func setStyle() {

        thumbnail.do {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }

        titleLabel.do {
            $0.textAlignment = .left
            $0.textColor = .black
            $0.font = .pretendard(.body4_b_13)
        }

        hostLabel.do {
            $0.textAlignment = .left
            $0.textColor = .gray05
            $0.font = .pretendard(.body7_r_13)
        }

        memberLabel.do {
            $0.textAlignment = .left
            $0.textColor = .gray05
            $0.font = .pretendard(.label3_r_11)
        }

        statusLabel.do {
            $0.font = .pretendard(.label2_m_11)
            $0.textAlignment = .center
            $0.layer.cornerRadius = 3
            $0.layer.masksToBounds = true
            $0.setContentHuggingPriority(UILayoutPriority.required, for: .horizontal)
            $0.setContentCompressionResistancePriority(UILayoutPriority.required, for: .horizontal)
        }
    }

    // MARK: - SetLayout

    private func setLayout() {
        thumbnail.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.height.equalTo(42)
        }

        titleLabel.snp.makeConstraints {
            $0.top.trailing.equalToSuperview()
            $0.leading.equalTo(thumbnail.snp.trailing).offset(11)
            $0.height.equalTo(18)
        }

        hostLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.equalTo(thumbnail.snp.trailing).offset(11)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(18)
        }

        memberLabel.snp.makeConstraints {
            $0.top.equalTo(hostLabel.snp.bottom)
            $0.leading.equalTo(thumbnail.snp.trailing).offset(11)
            $0.height.equalTo(15)
        }

        statusLabel.snp.makeConstraints {
            $0.centerY.equalTo(memberLabel.snp.centerY)
            $0.leading.equalTo(memberLabel.snp.trailing).offset(4)
            $0.height.equalTo(19)
        }
    }
}

// MARK: - dataBind

extension RecommendedClubCell {
    func dataBind(_ itemData: RecommendedClubModel) {
        thumbnail.image = itemData.thumbnail
        titleLabel.text = itemData.title
        hostLabel.text = itemData.host
        memberLabel.text = itemData.member

        if itemData.isRecruiting {
            statusLabel.do {
                $0.text = "모집중"
                $0.textColor = .main_blue
                $0.backgroundColor = .light_blue
            }
            statusLabel.snp.makeConstraints {
                $0.width.equalTo(37)
            }
        } else {
            statusLabel.do {
                $0.text = "마감"
                $0.textColor = .alert_red
                $0.backgroundColor = .light_red
            }
            statusLabel.snp.makeConstraints {
                $0.width.equalTo(28)
            }
        }
    }
}

