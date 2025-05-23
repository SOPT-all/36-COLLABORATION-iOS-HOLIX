//
//  BubbleLabelView.swift
//  HOLIX_iOS
//
//  Created by 임재현 on 5/16/25.
//

import UIKit

import SnapKit
import Then

final class BubbleLabelView: UIView {

    // MARK: - UI Components

    private let messageLabel = UILabel()

    // MARK: - Lifecycle

    init(isSender: Bool) {
        super.init(frame: .zero)
        setUI()
        setStyle(isSender: isSender)
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - SetUI

    private func setUI() {
        self.addSubview(messageLabel)
    }

    // MARK: - SetStyle

     func setStyle(isSender: Bool) {

        messageLabel.do {
            $0.numberOfLines = 0
            $0.textColor = .white
            $0.backgroundColor = .clear
            $0.lineBreakMode = .byCharWrapping
            $0.font = .pretendard(.body3_r_15)
        }

        backgroundColor = isSender ? .systemBlue : .lightGray
        layer.cornerRadius = 16
        layer.maskedCorners = isSender
            ? [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner]
            : [.layerMaxXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMinYCorner]
    }

    // MARK: - SetLayout

    private func setLayout() {
        messageLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.bottom.equalToSuperview().inset(8)
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.width.lessThanOrEqualTo(250)
        }
    }

    func configure(with message: String) {
        messageLabel.text = message
    }
}
