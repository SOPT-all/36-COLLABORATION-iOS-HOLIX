//
//  SystemMessageCell.swift
//  HOLIX_iOS
//
//  Created by 임재현 on 5/23/25.
//

import UIKit

import SnapKit
import Then

final class SystemMessageCell: UITableViewCell {
  
    // MARK: - UI Components
    
    private let messageLabel = UILabel()
    
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
        contentView.addSubview(messageLabel)
    }
    
    // MARK: - SetStyle

    private func setStyle() {
        selectionStyle = .none
        backgroundColor = .clear

        messageLabel.do {
            $0.textAlignment = .center
            $0.font = .pretendard(.label3_r_11)
            $0.textColor = .gray
            $0.numberOfLines = 0
        }
    }
    
    // MARK: - SetLayout

    private func setLayout() {
        messageLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(8)
            $0.centerX.equalToSuperview()
            $0.leading.greaterThanOrEqualToSuperview().offset(20)
            $0.trailing.lessThanOrEqualToSuperview().offset(-20)
        }
    }
}

// MARK: - Configure

extension SystemMessageCell {
    func configure(text: String) {
        messageLabel.text = text
    }
}
