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
    private let bannerPageIndicatorImage = [
        ImageLiterals.pagebutton_01,
        ImageLiterals.pagebutton_02,
        ImageLiterals.pagebutton_03,
        ImageLiterals.pagebutton_04,
        ImageLiterals.pagebutton_05,
        ImageLiterals.pagebutton_06
    ]
    private let categoryBoxMenuData = CategoryBoxMenuResponse.mockData()

    // MARK: - UI Components

    private lazy var homeCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: self.createCompositionalLayout()
    )
    private let bannerPageLabel = UILabel()
    private let bannerPageIndicatorImageView = UIImageView()

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)

        setUp()
        setStyle()
        setLayout()
        setRegister()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateBannerOverlayPosition()
    }

    // MARK: - Setup

    private func setUp() {
        view.addSubviews(
            homeCollectionView,
            bannerPageLabel,
            bannerPageIndicatorImageView
        )
    }

    // MARK: - SetStyle

    private func setStyle() {
        homeCollectionView.do {
            $0.backgroundColor = .white
            $0.delegate = self
            $0.dataSource = self
            $0.showsHorizontalScrollIndicator = false
        }

        bannerPageLabel.do {
            $0.backgroundColor = .gray07
            $0.font = .pretendard(.body7_r_13)
            $0.layer.cornerRadius = 12
            $0.clipsToBounds = true
            $0.textColor = .white
            $0.textAlignment = .center
            $0.text = "1/\(bannerData.count)"
        }

        bannerPageIndicatorImageView.do {
            $0.contentMode = .scaleAspectFit
            $0.image = bannerPageIndicatorImage[0]
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
            $0.register(SearchCategoryCell.self, forCellWithReuseIdentifier: SearchCategoryCell.identifier)
            $0.register(BannerCell.self, forCellWithReuseIdentifier: BannerCell.identifier)
            $0.register(CategoryBoxCell.self, forCellWithReuseIdentifier: CategoryBoxCell.identifier)
        }
    }

    // MARK: - Layout Configuration

    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return HomeSectionLayoutFactory.create()
    }

    //MARK: - Banner Section Indicator Method

    private func updateBannerOverlayPosition() {

        let indexPath = IndexPath(item: 0, section: HomeSectionType.banner.rawValue)
        guard let attributes = homeCollectionView.layoutAttributesForItem(at: indexPath) else { return }


        let cellFrame = attributes.frame
        let convertedFrame = homeCollectionView.convert(cellFrame, to: view)

        bannerPageLabel.snp.remakeConstraints {
            $0.size.equalTo(CGSize(width: 44, height: 28))
            $0.top.equalToSuperview().offset(convertedFrame.minY + 16)
            $0.trailing.equalToSuperview().inset(15)
        }

        bannerPageIndicatorImageView.snp.remakeConstraints {
            $0.size.equalTo(CGSize(width: 93, height: 8))
            $0.top.equalToSuperview().offset(convertedFrame.maxY - 20)
            $0.centerX.equalToSuperview()
        }
    }

    private func updateBannerPageIndicator(currentPage: Int) {
        bannerPageLabel.text = "\(currentPage + 1)/\(bannerData.count)"
        bannerPageIndicatorImageView.image = bannerPageIndicatorImage[currentPage]
    }
}

// MARK: - UICollectionView Delegate & DataSource

extension HomeViewController: UICollectionViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateBannerOverlayPosition()
    }

    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        guard HomeSectionType(rawValue: indexPath.section) == .banner else { return }

        let currentPage = indexPath.item
        DispatchQueue.main.async { [weak self] in
            self?.updateBannerPageIndicator(currentPage: currentPage)
        }
    }
}

extension HomeViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return HomeSectionType.allCases.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let sectionType = HomeSectionType(rawValue: section) else { return 0 }
        switch sectionType {
        case .searchCategory:
            return 1
        case .banner:
            return bannerData.count
        case .categoryBoxMenu:
            return categoryBoxMenuData.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let sectionType = HomeSectionType(rawValue: indexPath.section) else {
            return UICollectionViewCell()
        }

        switch sectionType {
        case .searchCategory:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: SearchCategoryCell.identifier,
                for: indexPath) as! SearchCategoryCell
            return cell
        case .banner:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: BannerCell.identifier,
                for: indexPath) as! BannerCell
            cell.configure(image: bannerData[indexPath.item].Image)
            return cell
        case .categoryBoxMenu:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CategoryBoxCell.identifier,
                for: indexPath) as! CategoryBoxCell
            cell.configure(
                image: categoryBoxMenuData[indexPath.item].Image,
                labelName: categoryBoxMenuData[indexPath.item].name
            )
            return cell
        }
    }
}
