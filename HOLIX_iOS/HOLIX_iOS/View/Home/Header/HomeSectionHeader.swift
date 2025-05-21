//
//  HomeSectionHeader.swift
//  HOLIX_iOS
//
//  Created by 정정욱 on 5/18/25.
//

import UIKit

import SnapKit
import Then

final class HomeSectionHeader: UICollectionReusableView {

    // MARK: - Properties

    static let elementKind = "\(HomeSectionHeader.className)-element-kind"
    static let identifier = HomeSectionHeader.className

    // MARK: - UI Components

    private let titleLabel = UILabel()
    private let seeMoreButton = UIButton()

    // MARK: - LifeCycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        setStyle()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setUp() {
        addSubviews(titleLabel, seeMoreButton)
    }

    // MARK: - SetStyle

    private func setStyle() {
        titleLabel.do {
            $0.font = .pretendard(.title1_b_17)
        }

        seeMoreButton.do {
            $0.setTitle("더보기", for: .normal)
            $0.setTitleColor(.gray04, for: .normal)
            $0.titleLabel?.font = .pretendard(.body2_m_15)
        }
    }

    // MARK: - SetLayout

    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }

        seeMoreButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.trailing.equalToSuperview().inset(15)
        }
    }
}

//MARK: - Configure

extension HomeSectionHeader {
    func configure(title: String) {
        titleLabel.text = title
    }
}

