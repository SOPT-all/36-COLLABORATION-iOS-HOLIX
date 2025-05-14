//
//  TopTabBarView.swift
//  HOLIX_iOS
//
//  Created by 정정욱 on 5/14/25.
//

import UIKit

import SnapKit
import Then

final class TopTabBarView: UIView {

    // MARK: - Properties

    private var items: [String]
    private var selectedIndex: Int = 0

    // MARK: - UI Components

    private lazy var tabCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    init(items: [String]) {
        self.items = items
        super.init(frame: .zero)
        setUI()
        setDelegate()
        setStyle()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setUI() {
        addSubview(tabCollectionView)
    }

    // MARK: - SetDelegate

    private func setDelegate() {
        tabCollectionView.delegate = self
        tabCollectionView.dataSource = self
    }

    // MARK: - SetStyle

    private func setStyle() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = .zero

        tabCollectionView.do {
            $0.collectionViewLayout = layout
            $0.showsHorizontalScrollIndicator = false
            $0.backgroundColor = .clear
            $0.register(TopTabCell.self, forCellWithReuseIdentifier: TopTabCell.identifier)
        }
    }

    // MARK: - SetLayout

    private func setLayout() {
        tabCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: - UICollectionView Delegate & DataSource

extension TopTabBarView: UICollectionViewDelegate {

}

extension TopTabBarView: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return items.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: TopTabCell.identifier,
            for: indexPath
        ) as? TopTabCell else {
            return UICollectionViewCell()
        }

        let title = items[indexPath.item]
        print("등록된 셀 ID: \(TopTabCell.identifier)") // "TopTabCell" 나와야 함
        cell.configure(title: title, isSelected: indexPath.item == selectedIndex)
        return cell
    }
}

extension TopTabBarView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let title = items[indexPath.item]

        //let width = (title as NSString).size(withAttributes: [.font: UIFont.systemFont(ofSize: 15)]).width + 20
        return CGSize(width: 64, height: 40)
    }
}
