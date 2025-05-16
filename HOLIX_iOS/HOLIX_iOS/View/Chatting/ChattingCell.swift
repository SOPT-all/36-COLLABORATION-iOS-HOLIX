//
//  ChattingCell.swift
//  HOLIX_iOS
//
//  Created by 임재현 on 5/16/25.
//

import UIKit

import SnapKit
import Then

final class ChattingCell: UITableViewCell {
   
    // MARK: - Properties
    private var isSender: Bool = false
    
    // MARK: - UI Components
    
    private let bubbleView: BubbleLabelView
    private let profileImageView = UIImageView()
    private let nicknameLabel = UILabel()
    
    // MARK: - Lifecycle
    
    init(isSender: Bool) {
        self.bubbleView = BubbleLabelView(isSender: isSender)
        super.init(style: .default, reuseIdentifier: nil)
        self.selectionStyle = .none
        setUI(isSender: isSender)
        setStyle(isSender: isSender)
        setLayout(isSender: isSender)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - SetUI
    
    private func setUI(isSender: Bool) {
        self.addSubview(bubbleView)
        if isSender {

        } else {
            self.addSubviews(profileImageView,nicknameLabel)
        }
    }
    
    // MARK: - SetStyle
    
    private func setStyle(isSender: Bool) {
        if isSender {
            
        } else {
            profileImageView.do {
                $0.layer.cornerRadius = 16
                $0.clipsToBounds = true
            }
            
            nicknameLabel.do {
                $0.font = .pretendard(.body6_m_13)
                $0.textColor = .darkGray
            }
        }
    }
    
    // MARK: - SetLayout
    
    private func setLayout(isSender: Bool) {
        if isSender {
            bubbleView.snp.makeConstraints {
                $0.top.bottom.equalToSuperview().inset(4)
                $0.trailing.equalToSuperview().inset(12)
                $0.leading.greaterThanOrEqualToSuperview().offset(80)
            }
        } else {
            profileImageView.snp.makeConstraints {
                $0.leading.equalToSuperview().offset(12)
                $0.top.equalToSuperview().offset(4)
                $0.size.equalTo(32)
            }
            
            nicknameLabel.snp.makeConstraints {
                $0.leading.equalTo(profileImageView.snp.trailing).offset(8)
                $0.top.equalToSuperview().offset(4)
            }

            bubbleView.snp.makeConstraints {
                $0.top.equalTo(nicknameLabel.snp.bottom).offset(4)
                $0.leading.equalTo(profileImageView.snp.trailing).offset(8)
                $0.trailing.lessThanOrEqualToSuperview().offset(-50)
                $0.bottom.equalToSuperview().inset(4)
            }
        }
    }
    
    
    func configure(with message: String, nickname: String? = nil, profileImage: UIImage? = nil, isSender: Bool) {
        bubbleView.configure(with: message)
        nicknameLabel.text = nickname
        if let profileImage = profileImage {
            profileImageView.image = profileImage
        }
    }
}
