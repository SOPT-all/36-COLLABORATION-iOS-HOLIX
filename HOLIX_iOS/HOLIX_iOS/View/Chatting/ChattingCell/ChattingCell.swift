//
//  ChattingCell.swift
//  HOLIX_iOS
//
//  Created by 임재현 on 5/16/25.
//

import UIKit

import SnapKit
import Then

enum ChattingCellType {
    case sender
    case receiver
}

class ChattingCell: UITableViewCell {

    // MARK: - Properties

    private var isSender = true
    private var profileImageURL: String?
    
    // MARK: - UI Components

    private lazy var bubbleView = BubbleLabelView(isSender: true)
    private var profileImageView = UIImageView()
    private let nicknameLabel = UILabel()
    private let introductionLabel = UILabel()
    private let infoStackView = UIStackView()
    private let timeLabel = UILabel()

     // MARK: - Lifecycle

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
        infoStackView.addArrangedSubview(nicknameLabel)
        infoStackView.addArrangedSubview(introductionLabel)
        contentView.addSubviews(profileImageView, infoStackView, bubbleView, timeLabel)
    }

    // MARK: - SetStyle

    private func setStyle() {
        selectionStyle = .none
        backgroundColor = .clear

        infoStackView.do {
            $0.axis = .horizontal
            $0.spacing = 4
            $0.alignment = .center
        }

        nicknameLabel.do {
            $0.font = .pretendard(.body6_m_13)
            $0.textColor = .darkGray
        }

        introductionLabel.do {
            $0.font = .pretendard(.label2_m_11)
            $0.textColor = .lightGray
            $0.text = "· 안녕하세요"
        }

        profileImageView.do {
            $0.layer.cornerRadius = 16
            $0.clipsToBounds = true
            $0.image = .imgProfileNoramlIos03
        }

        timeLabel.do {
            $0.font = .pretendard(.label4_m_9)
            $0.textColor = .lightGray
        }
    }

    // MARK: - SetLayout

    private func setLayout() {
        profileImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(12)
            $0.top.equalToSuperview().offset(4)
            $0.size.equalTo(32)
        }

        infoStackView.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(8)
            $0.top.equalToSuperview().offset(4)
            $0.trailing.lessThanOrEqualToSuperview().offset(-12)
        }

        bubbleView.snp.makeConstraints {
            $0.top.equalTo(nicknameLabel.snp.bottom).offset(4)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(8)
            $0.trailing.lessThanOrEqualToSuperview().offset(-12)
        }

        timeLabel.snp.makeConstraints {
            $0.top.equalTo(bubbleView.snp.bottom).offset(8)
            $0.trailing.equalTo(bubbleView.snp.trailing)
            $0.bottom.equalToSuperview().inset(4)
        }
    }
}

// MARK: - Configure

extension ChattingCell {

    func configure(
        with message: String,
        nickname: String? = nil,
        profileImage: String? = nil,
        isSender: Bool,
        introduction: String? = nil,
        createdAt: String
    ) {
        self.isSender = isSender
        bubbleView.configure(with: message)
        bubbleView.setStyle(isSender: isSender)

        profileImageView.isHidden = isSender
        infoStackView.isHidden = isSender
        profileImageURL = profileImage

        bubbleView.snp.remakeConstraints {
            $0.top.equalTo(isSender ? contentView.snp.top : nicknameLabel.snp.bottom).offset(4)
            if isSender {
                $0.trailing.equalToSuperview().inset(12)
                $0.leading.greaterThanOrEqualToSuperview().offset(80)
            } else {
                $0.leading.equalTo(profileImageView.snp.trailing).offset(8)
                $0.trailing.lessThanOrEqualToSuperview().offset(-12)
            }
        }

        timeLabel.snp.remakeConstraints {
            $0.top.equalTo(bubbleView.snp.bottom).offset(8)
            if isSender {
                    $0.trailing.equalTo(bubbleView.snp.trailing)
                } else {
                    $0.leading.equalTo(bubbleView.snp.leading)
                }
            $0.bottom.equalToSuperview().inset(4)
        }

        timeLabel.text = createdAt

        if !isSender {
            if let url = URL(string: profileImageURL ?? "") {
                profileImageView.kf.setImage(with: url)
            }
            nicknameLabel.text = nickname
            introductionLabel.text = introduction
        }
    }
}
