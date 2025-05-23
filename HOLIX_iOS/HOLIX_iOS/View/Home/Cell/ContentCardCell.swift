//
//  ContentCardCell.swift
//  HOLIX_iOS
//
//  Created by 정정욱 on 5/18/25.
//

import UIKit

import SnapKit
import Then
import Kingfisher

final class ContentCardCell: UICollectionViewCell {

    // MARK: - Properties

    static let identifier = ContentCardCell.className
    private var studyTag = [Tag]()

    // MARK: - UI Components

    private var studyBannerImageView = UIImageView()
    private let tagStackView = UIStackView()
    private let labelStackView = UIStackView()
    private var studyTitleLabel = UILabel()
    private var studyLeaderLabel = UILabel()
    private var priceLabel = UILabel()

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
        labelStackView.addArrangedSubview(studyTitleLabel)
        labelStackView.addArrangedSubview(studyLeaderLabel)
        labelStackView.addArrangedSubview(priceLabel)

        contentView
            .addSubviews(
                studyBannerImageView,
                tagStackView,
                labelStackView
            )
    }

    // MARK: - SetStyle

    private func setStyle() {
        studyBannerImageView.do {
            $0.contentMode = .scaleAspectFill
            $0.layer.cornerRadius = 10
            $0.clipsToBounds = true
        }

        tagStackView.do {
            $0.axis = .horizontal
            $0.spacing = 7
            $0.distribution = .fillProportionally
            $0.alignment = .leading
        }

        labelStackView.do {
            $0.axis = .vertical
            $0.spacing = 2
            $0.distribution = .fillProportionally
            $0.alignment = .leading
        }

        studyTitleLabel.do {
            $0.font = .pretendard(.title3_b_15)
            $0.numberOfLines = 2
            $0.lineBreakMode = .byTruncatingTail
        }

        studyLeaderLabel.do {
            $0.font = .pretendard(.body6_m_13)
            $0.textColor = .gray06
        }

        priceLabel.do {
            $0.font = .pretendard(.body4_b_13)
        }
    }

    // MARK: - SetLayout

    private func setLayout() {
        studyBannerImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.width.equalTo(228)
            $0.height.equalTo(150)
        }

        tagStackView.snp.makeConstraints {
            $0.top.equalTo(studyBannerImageView.snp.bottom).offset(12)
            $0.leading.equalToSuperview()
            $0.trailing.lessThanOrEqualToSuperview()
        }

        labelStackView.snp.makeConstraints {
            $0.top.equalTo(tagStackView.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview()
        }
    }

    //MARK: - Method

    private func updateTags() {
        tagStackView.arrangedSubviews.forEach { $0.removeFromSuperview() } // 기존 태그 초기화 cell 재사용 문제

        for tag in studyTag {
            let label = UILabel()
            label.text = tag.tagName
            label.font = .pretendard(.label2_m_11)
            label.textColor = color(for: tag.tagColor)
            label.layer.cornerRadius = 10
            label.clipsToBounds = true
            label.textAlignment = .center
            label.backgroundColor = .clear
            label.layer.borderColor = color(for: tag.tagColor).cgColor
            label.layer.borderWidth = 1
            label.setContentHuggingPriority(.required, for: .horizontal)
            label.setContentCompressionResistancePriority(.required, for: .horizontal)

            // 텍스트 기반 너비 계산
            label.sizeToFit()
            let width = label.intrinsicContentSize.width + 10

            label.snp.makeConstraints {
                $0.height.equalTo(21)
                $0.width.equalTo(width)
            }

            tagStackView.addArrangedSubview(label)
        }
    }

    private func color(for tagColor: String) -> UIColor {
        switch tagColor {
        case "blue": return .main_blue
        case "black": return .gray06
        default: return .black
        }
    }
}

//MARK: - Configure

extension ContentCardCell {
    func configure(with model: Study) {
        if let url = URL(string: model.url) {
            studyBannerImageView.kf.setImage(with: url)
        }
        studyTitleLabel.text = model.studyTitle
        studyLeaderLabel.text = model.studyLeader
        priceLabel.text = model.price
        studyTag = model.tags
        updateTags()
    }
}
