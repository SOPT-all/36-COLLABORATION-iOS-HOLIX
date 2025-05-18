//
//  CompositionalLayoutFactory.swift
//  HOLIX_iOS
//
//  Created by 정정욱 on 5/15/25.
//

import UIKit

enum HomeSectionType: Int, CaseIterable {
    case searchCategory = 0
    case banner
//    case categoryMenu
//    case popularStudy
//    case recommendedContent
}

struct CompositionalLayoutFactory {

    static func create() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionNumber, _ in
            let section: NSCollectionLayoutSection

            switch HomeSectionType(rawValue: sectionNumber) {
            case .searchCategory:
                section = makeSearchCategorySection()
            case .banner:
                section = makeBannerSection()
            case .none:
                section = makeBannerSection()
            }

            return section
        }
    }

    private static func makeSearchCategorySection() -> NSCollectionLayoutSection {

        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(90))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        return section
    }

    private static func makeBannerSection() -> NSCollectionLayoutSection {

        // 아이템 사이즈
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        // 그룹 사이즈
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(382))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        // 섹션 사이즈
        let section = NSCollectionLayoutSection(group: group) // 섹션의 크기는 내부 그룹이 결정
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        section.orthogonalScrollingBehavior = .paging
        return section
    }
}
