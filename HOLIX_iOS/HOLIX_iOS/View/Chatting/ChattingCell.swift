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

     // MARK: - UI Components
    private var bubbleView: BubbleLabelView?
    private let profileImageView = UIImageView()
    private let nicknameLabel = UILabel()
    private let introductionLabel = UILabel()
    private let infoStackView = UIStackView()
    private let timeLabel = UILabel()

     // MARK: - Lifecycle
     
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Configure
    func configure(with message: String, nickname: String? = nil, profileImage: String? = nil, isSender: Bool) {

        bubbleView?.removeFromSuperview()
        profileImageView.removeFromSuperview()
        nicknameLabel.removeFromSuperview()
        introductionLabel.removeFromSuperview()
        infoStackView.removeFromSuperview()
        infoStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        timeLabel.removeFromSuperview()

        let bubble = BubbleLabelView(isSender: isSender)
        self.bubbleView = bubble
        self.addSubviews(bubble,timeLabel)

        if isSender {
            bubble.snp.makeConstraints {
                $0.top.equalToSuperview().inset(4)
                $0.trailing.equalToSuperview().inset(12)
                $0.leading.greaterThanOrEqualToSuperview().offset(80)
            }
            timeLabel.snp.makeConstraints {
                $0.top.equalTo(bubble.snp.bottom).offset(8)
                $0.trailing.equalTo(bubble.snp.trailing)
                $0.bottom.equalToSuperview().inset(4)
            }
            
            timeLabel.font = .pretendard(.label1_b_11)
            timeLabel.textColor = .lightGray
            timeLabel.text = "오후 19:22"
        } else {

            self.addSubviews(profileImageView,infoStackView)
            infoStackView.addArrangedSubview(nicknameLabel)
            infoStackView.addArrangedSubview(introductionLabel)
            
            infoStackView.axis = .horizontal
            infoStackView.spacing = 4
            infoStackView.alignment = .center


            profileImageView.layer.cornerRadius = 16
            profileImageView.clipsToBounds = true
            profileImageView.image = UIImage(named: profileImage ?? "")

            nicknameLabel.font = .pretendard(.body6_m_13)
            nicknameLabel.textColor = .darkGray
            nicknameLabel.text = nickname
            
            introductionLabel.text = "· 안녕하세요"
            introductionLabel.textColor = .lightGray
            introductionLabel.font = .pretendard(.label1_b_11)
            

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

            bubble.snp.makeConstraints {
                $0.top.equalTo(nicknameLabel.snp.bottom).offset(4)
                $0.leading.equalTo(profileImageView.snp.trailing).offset(8)
                $0.trailing.lessThanOrEqualToSuperview().offset(-50)
            }
            
            timeLabel.snp.makeConstraints {
                $0.top.equalTo(bubble.snp.bottom).offset(4)
                $0.leading.equalTo(bubble.snp.leading)
                $0.bottom.equalToSuperview().inset(4)
                
            }
            
            timeLabel.font = .pretendard(.label1_b_11)
            timeLabel.textColor = .lightGray
            timeLabel.text = "오후 19:22"
        }

        bubble.configure(with: message)
    }
}
