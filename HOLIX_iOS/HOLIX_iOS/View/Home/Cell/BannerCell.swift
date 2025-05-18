//
//  BannerCell.swift
//  HOLIX_iOS
//
//  Created by 정정욱 on 5/15/25.
//

import UIKit

import SnapKit
import Then

final class BannerCell: UICollectionViewCell {

    // MARK: - Properties

    static let identifier = BannerCell.className

    // MARK: - UI Components

    private var bannerImage = UIImageView()

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
        contentView.addSubview(bannerImage)
    }

    // MARK: - SetStyle

    private func setStyle() {
        bannerImage.do {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
        }
    }

    // MARK: - SetLayout

    private func setLayout() {
        bannerImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

//MARK: - Configure

extension BannerCell {
    func configure(image: UIImage) {
         bannerImage.image = image
     }
}
