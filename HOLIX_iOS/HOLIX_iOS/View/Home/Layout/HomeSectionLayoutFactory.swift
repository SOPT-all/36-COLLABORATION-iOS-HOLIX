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
    case categoryBoxMenu
    //    case popularStudy
    //    case recommendedContent
}

struct HomeSectionLayoutFactory {

    static func create() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionNumber, _ in
            let section: NSCollectionLayoutSection

            switch HomeSectionType(rawValue: sectionNumber) {
            case .searchCategory:
                section = makeSearchCategorySection()
            case .banner:
                section = makeBannerSection()
            case .categoryBoxMenu:
                section = makeCategoryBoxMenuSection()
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

    private static func makeCategoryBoxMenuSection() -> NSCollectionLayoutSection {

        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0 / 4.0),
            heightDimension: .absolute(72)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(72)
        )

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: Array(repeating: item, count: 4)
        )
        group.interItemSpacing = .fixed(7) // 아이템 간 간격

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 17, bottom: 0, trailing: 17)
        return section
    }
}
