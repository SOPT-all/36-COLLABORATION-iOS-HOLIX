//
//  MyClubCell.swift
//  HOLIX_iOS
//
//  Created by 쏘 on 5/16/25.
//

import UIKit

import SnapKit
import Then

final class MyClubCell: UICollectionViewCell {

    // MARK: - Properties

    static let identifier = MyClubCell.className

    // MARK: - UI Components

    let thumbnail = UIImageView()
    let pinButton = UIButton()
    let titleLabel = UILabel()
    let memberLabel = UILabel()

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
        contentView.addSubviews(thumbnail, pinButton, titleLabel, memberLabel)
        contentView.bringSubviewToFront(pinButton)
    }

    // MARK: - SetStyle

    private func setStyle() {

        self.do {
            $0.layer.cornerRadius = 10
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.gray02.cgColor
            $0.layer.masksToBounds = true
        }

        thumbnail.do {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }

        pinButton.do {
            $0.setImage(IconLiterals.ic_pin, for: .normal)
            $0.setImage(IconLiterals.ic_pin_fillied_active, for: .selected)
        }

        titleLabel.do {
            $0.textAlignment = .left
            $0.textColor = .black
            $0.font = .pretendard(.body4_b_13)
            $0.numberOfLines = 2
            $0.lineBreakMode = .byCharWrapping
        }

        memberLabel.do {
            $0.textAlignment = .left
            $0.textColor = .gray05
            $0.font = .pretendard(.label3_r_11)
        }

    }

    // MARK: - SetLayout

    private func setLayout() {
        thumbnail.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(99)
        }

        pinButton.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(8)
            $0.height.width.equalTo(30)
        }

        titleLabel.snp.makeConstraints {
            $0.top.equalTo(thumbnail.snp.bottom).offset(9)
            $0.leading.trailing.equalToSuperview().inset(6)
            $0.height.equalTo(36)
        }

        memberLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(6)
            $0.bottom.equalToSuperview().inset(5)
            $0.height.equalTo(15)
        }
    }
}

// MARK: - Configure

extension MyClubCell {
    func dataBind(_ club: Club) {
        thumbnail.loadImage(from: club.url)
        titleLabel.text = club.title
        memberLabel.text = "멤버 " + club.participants
        pinButton.isSelected = club.isPinned
    }
}
