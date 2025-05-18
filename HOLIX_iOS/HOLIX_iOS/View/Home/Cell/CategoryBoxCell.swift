//
//  CategoryBoxMenuCell.swift
//  HOLIX_iOS
//
//  Created by 정정욱 on 5/18/25.
//

import UIKit

final class CategoryBoxCell: UICollectionViewCell {

    // MARK: - Properties

    static let identifier = CategoryBoxCell.className

    // MARK: - UI Components

    private var categoryBackgroundView = UIView()
    private var categoryImage = UIImageView()
    private var categoryLabel = UILabel()

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

    // MARK: - Setup

    private func setUI() {
        categoryBackgroundView
            .addSubviews(
                categoryImage,
                categoryLabel
            )
        contentView
            .addSubviews(
                categoryBackgroundView
            )
    }

    // MARK: - SetStyle

    private func setStyle() {
        categoryBackgroundView.do {
            $0.backgroundColor = .gray01
            $0.layer.cornerRadius = 8
            $0.clipsToBounds = true
        }

        categoryImage.do {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }

        categoryLabel.do {
            $0.font = .pretendard(.body7_r_13)
        }
    }

    // MARK: - SetLayout

    private func setLayout() {
        categoryBackgroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        categoryImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(18)
            $0.height.equalTo(17)
        }

        categoryLabel.snp.makeConstraints {
            $0.top.equalTo(categoryImage.snp.bottom).offset(14.6)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(8.4)
        }
    }
}

//MARK: - Configure

extension CategoryBoxCell {
    func configure(image: UIImage, labelName: String) {
        categoryImage.image = image
        categoryLabel.text = labelName
     }
}
