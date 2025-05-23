//
//  CategoryTopTabBar.swift
//  HOLIX_iOS
//
//  Created by 정정욱 on 5/14/25.
//

import UIKit

import SnapKit
import Then

final class CategoryTabBarView: UIView {

    // MARK: - Properties

    private var items: [String]
    private var selectedIndex: Int = 0
    private var indicatorLeadingConstraint: Constraint?
    private var indicatorWidthConstraint: Constraint?

    // MARK: - UI Components

    private lazy var tabCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    private let indicatorView = UIView()

    // MARK: - LifeCycle

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
        tabCollectionView.addSubview(indicatorView)
        tabCollectionView.bringSubviewToFront(indicatorView)
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
            $0.register(CategoryTabBarCell.self, forCellWithReuseIdentifier: CategoryTabBarCell.identifier)
        }

        indicatorView.do {
            $0.backgroundColor = .systemBlue
        }
    }

    // MARK: - SetLayout

    private func setLayout() {
        tabCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        indicatorView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(38)
            $0.height.equalTo(2)
            self.indicatorLeadingConstraint = $0.leading.equalToSuperview().constraint
            self.indicatorWidthConstraint = $0.width.equalTo(0).constraint
        }
    }

    func selectItem(at index: Int) {
        guard index >= 0 && index < items.count else { return }

        let previousIndex = selectedIndex
        selectedIndex = index

        // 선택된 두 셀만 리로드 - tabCollectionView 전체 깜빡임 방지
        tabCollectionView.performBatchUpdates {
            let indexPaths = [IndexPath(item: previousIndex, section: 0),
                              IndexPath(item: selectedIndex, section: 0)]
            tabCollectionView.reloadItems(at: indexPaths)
        }

        // 스크롤 및 indicator 애니메이션
        tabCollectionView.scrollToItem(at: IndexPath(item: selectedIndex, section: 0),
                                       at: .centeredHorizontally,
                                       animated: true)
        guard let cell = tabCollectionView.cellForItem(at: IndexPath(item: selectedIndex, section: 0)) else { return }
        let cellFrame = cell.frame

        indicatorLeadingConstraint?.update(offset: cellFrame.origin.x)
        indicatorWidthConstraint?.update(offset: cellFrame.width)

        UIView.animate(withDuration: 0.2) {
            self.tabCollectionView.layoutIfNeeded()
        }
    }
}

// MARK: - UICollectionView Delegate & DataSource

extension CategoryTabBarView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectItem(at: indexPath.item)
    }
}

extension CategoryTabBarView: UICollectionViewDataSource {
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
            withReuseIdentifier: CategoryTabBarCell.identifier,
            for: indexPath
        ) as? CategoryTabBarCell else {
            return UICollectionViewCell()
        }

        let title = items[indexPath.item]
        cell.configure(title: title, isSelected: indexPath.item == selectedIndex)
        return cell
    }
}

extension CategoryTabBarView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 64, height: 40)
    }
}
