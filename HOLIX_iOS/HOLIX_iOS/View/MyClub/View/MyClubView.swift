//
//  MyClubView.swift
//  HOLIX_iOS
//
//  Created by 쏘 on 5/16/25.
//

import UIKit

import SnapKit
import Then

final class MyClubView: UIView {

    // MARK: - Properties

    private var itemData: [Club] = []
    final let cellWidth: CGFloat = UIScreen.main.bounds.width * 165 / 375
    final let cellHeight: CGFloat = 174
    var onClubTapped: ((String) -> Void)?

    // MARK: - UI Components

    private lazy var clubCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )

    // MARK: - LifeCycle

    override init(frame: CGRect) {
        super.init(frame: frame)
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
        addSubview(clubCollectionView)
        clubCollectionView.register(MyClubCell.self, forCellWithReuseIdentifier: MyClubCell.identifier)
    }

    // MARK: - SetDelegate

    private func setDelegate() {
        clubCollectionView.delegate = self
        clubCollectionView.dataSource = self
    }

    // MARK: - SetStyle

    private func setStyle() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = .zero
    }

    // MARK: - SetLayout

    private func setLayout() {
        clubCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: - UICollectionView Delegate & DataSource

extension MyClubView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedClub = itemData[indexPath.item]
        print("선택된 클럽: ", selectedClub.clubId)
        onClubTapped?("\(selectedClub.clubId)")
    }
}

extension MyClubView: UICollectionViewDelegateFlowLayout {
    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt _: IndexPath) -> CGSize {

        return CGSize(width: cellWidth, height: cellHeight)
    }
}

extension MyClubView: UICollectionViewDataSource {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {

        return itemData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyClubCell.identifier, for: indexPath) as? MyClubCell else { return MyClubCell() }
        cell.dataBind(itemData[indexPath.item])

        return cell
    }
}

extension MyClubView {

    // MARK: - caculateHeight

    func calculatedHeight() -> CGFloat {
            let itemCount = itemData.count
            let rows = Int(ceil(Double(itemCount) / 2.0))
            let spacing: CGFloat = 10
            let inset: CGFloat = 16

            return CGFloat(rows) * (cellHeight + spacing) - spacing + inset
    }

    // MARK: - updateData

    func updateData(_ clubs: [Club]) {
        self.itemData = clubs
        self.clubCollectionView.reloadData()
    }
}
