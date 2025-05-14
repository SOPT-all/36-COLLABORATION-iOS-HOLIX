//
//  TopTabCell.swift
//  HOLIX_iOS
//
//  Created by 정정욱 on 5/14/25.
//

import UIKit

import SnapKit
import Then

final class TopTabCell: UICollectionViewCell {

    // MARK: - Properties

    static let identifier = TopTabCell.className

    // MARK: - UI Components

    let titleLabel = UILabel()

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
        contentView.addSubview(titleLabel)
    }

    // MARK: - SetStyle

    private func setStyle() {
        titleLabel.do {
            $0.textAlignment = .center
            $0.textColor = .black
        }
    }

    // MARK: - SetLayout

    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension TopTabCell {
    func configure(title: String, isSelected: Bool) {
        titleLabel.text = title
        titleLabel.font = isSelected
            ? UIFont.pretendard(size: 15, weight: .Bold)
            : UIFont.pretendard(size: 15, weight: .Regular)
        titleLabel.textColor = isSelected ? .blue : .gray
    }
}
