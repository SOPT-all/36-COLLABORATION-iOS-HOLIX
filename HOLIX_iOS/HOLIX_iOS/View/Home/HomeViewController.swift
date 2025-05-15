//
//  HomeViewController.swift
//  HOLIX_iOS
//
//  Created by 정정욱 on 5/14/25.
//

import UIKit

import SnapKit
import Then

final class HomeViewController: UIViewController {

    // MARK: - Properties

    private let bannerData = BannerResponse.mockData()

    // MARK: - UI Components

    private lazy var homeCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: self.createCompositionalLayout()
    )

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        setStyle()
        setLayout()
        setRegister()
    }

    // MARK: - Setup

    private func setUp() {
        view.addSubviews(homeCollectionView)
    }

    // MARK: - SetStyle

    private func setStyle() {
        homeCollectionView.do {
            $0.backgroundColor = .white
            $0.dataSource = self
        }
    }

    // MARK: - SetLayout

    private func setLayout() {
        homeCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    // MARK: - SetRegister

    private func setRegister() {
        homeCollectionView.do {
            $0.register(BannerCell.self, forCellWithReuseIdentifier: BannerCell.identifier)
        }
    }

    // MARK: - Layout Configuration

    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return CompositionalLayoutFactory.create()
    }
}

// MARK: - UICollectionViewDataSource

extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return HomeSectionType.allCases.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let sectionType = HomeSectionType(rawValue: section) else { return 0 }
        switch sectionType {
        case .banner:
            return bannerData.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let sectionType = HomeSectionType(rawValue: indexPath.section) else {
            return UICollectionViewCell()
        }

        switch sectionType {
        case .banner:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: BannerCell.identifier,
                for: indexPath) as! BannerCell
            cell.configure(image: bannerData[indexPath.item].Image)
            return cell
        }
    }
}
