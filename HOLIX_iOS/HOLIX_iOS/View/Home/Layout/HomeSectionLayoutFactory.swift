//
//  CompositionalLayoutFactory.swift
//  HOLIX_iOS
//
//  Created by 정정욱 on 5/15/25.
//

import UIKit

enum HomeSectionType: Int, CaseIterable {
    case banner = 0
    case categoryBoxMenu
    case popularStudy
}

struct HomeSectionLayoutFactory {

    static func create() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionNumber, _ in
            let section: NSCollectionLayoutSection
            switch HomeSectionType(rawValue: sectionNumber) {
            case .banner:
                section = makeBannerSection()
            case .categoryBoxMenu:
                section = makeCategoryBoxMenuSection()
            case .popularStudy:
                section = makePopularStudySection()
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
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(382))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

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
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 17, bottom: 20, trailing: 17)

        return section
    }

    private static func makePopularStudySection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(228),
            heightDimension: .absolute(277)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 14, leading: 17, bottom: 0, trailing: 0)
        section.interGroupSpacing = 15 // 그룹 별 간격
        section.orthogonalScrollingBehavior = .continuous

        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(22)
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: HomeSectionHeader.elementKind,
            alignment: .top
        )

        section.boundarySupplementaryItems = [header]

        return section
    }
}
