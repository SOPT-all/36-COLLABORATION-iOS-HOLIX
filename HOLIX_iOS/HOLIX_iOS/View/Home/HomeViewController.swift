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

    private let hideThreshold: CGFloat = 80
    private var topSearchHeaderConstraint: Constraint?
    private var categoryTopTabBarConstraint: Constraint?
    private var currentVisibilityState: TopHeaderVisibilityState = .visible

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
    private let studyItemData = StudyItemModel.mockData()

    // MARK: - UI Components

    private lazy var homeCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: self.createCompositionalLayout()
    )
    private let topSearchHeaderView = SearchBarHeaderView()
    private let categoryTopTabBar = CategoryTabBarView(items: ["추천", "강의", "스터디", "북클럽", "멘토링", "커뮤니티"])
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
            topSearchHeaderView,
            categoryTopTabBar,
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
        topSearchHeaderView.snp.makeConstraints {
            topSearchHeaderConstraint = $0.top.equalTo(view.safeAreaLayoutGuide).constraint
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(40)
        }

        categoryTopTabBar.snp.makeConstraints {
            categoryTopTabBarConstraint = $0.top.equalTo(topSearchHeaderView.snp.bottom).constraint
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(40)
        }

        homeCollectionView.snp.makeConstraints {
            $0.top.equalTo(categoryTopTabBar.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }

    // MARK: - SetRegister

    private func setRegister() {
        homeCollectionView.do {
            $0.register(SearchCategoryCell.self, forCellWithReuseIdentifier: SearchCategoryCell.identifier)
            $0.register(BannerCell.self, forCellWithReuseIdentifier: BannerCell.identifier)
            $0.register(CategoryBoxCell.self, forCellWithReuseIdentifier: CategoryBoxCell.identifier)
            $0.register(ContentCardCell.self, forCellWithReuseIdentifier: ContentCardCell.identifier)
            $0.register(HomeSectionHeader.self,
                        forSupplementaryViewOfKind: HomeSectionHeader.elementKind,
                        withReuseIdentifier: HomeSectionHeader.identifier)
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

// MARK: - TopSearchHeader Transition

private extension HomeViewController {
    enum TopHeaderVisibilityState {
        case visible
        case hidden

        var alpha: CGFloat {
            switch self {
            case .visible: return 1
            case .hidden: return 0
            }
        }

        var offset: CGFloat {
            switch self {
            case .visible: return 0
            case .hidden: return -48
            }
        }
    }

    private func updateTabBarConstraints(for state: TopHeaderVisibilityState) {
        categoryTopTabBarConstraint?.deactivate()

        categoryTopTabBar.snp.remakeConstraints {
            switch state {
            case .visible:
                categoryTopTabBarConstraint = $0.top.equalTo(topSearchHeaderView.snp.bottom).constraint
            case .hidden:
                categoryTopTabBarConstraint = $0.top.equalTo(view.safeAreaLayoutGuide).constraint
            }
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(40)
        }

        topSearchHeaderConstraint?.update(offset: state.offset)
    }

    private func animateTopHeaderTransition(to state: TopHeaderVisibilityState) {
        guard currentVisibilityState != state else { return }

        view.layoutIfNeeded()
        updateTabBarConstraints(for: state)

        UIView.animate(withDuration: 0.25) {
            self.topSearchHeaderView.alpha = state.alpha
            self.view.layoutIfNeeded()
        }

        currentVisibilityState = state
    }
}

// MARK: - UICollectionView Delegate & DataSource

extension HomeViewController: UICollectionViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y

        if offsetY > hideThreshold && currentVisibilityState != .hidden {
            animateTopHeaderTransition(to: .hidden)
        } else if offsetY <= hideThreshold && currentVisibilityState != .visible {
            animateTopHeaderTransition(to: .visible)
        }

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
        case .banner:
            return bannerData.count
        case .categoryBoxMenu:
            return categoryBoxMenuData.count
        case .popularStudy:
            return studyItemData.count
        }
    }

    //MARK: - Cell Configure

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
        case .categoryBoxMenu:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CategoryBoxCell.identifier,
                for: indexPath) as! CategoryBoxCell
            cell.configure(
                image: categoryBoxMenuData[indexPath.item].Image,
                labelName: categoryBoxMenuData[indexPath.item].name
            )
            return cell
        case .popularStudy:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ContentCardCell.identifier,
                for: indexPath) as! ContentCardCell
            guard let item = studyItemData[indexPath.item].items.first else {
                return cell
            }
            cell.configure(with: item)
            return cell
        }
    }

    //MARK: - Header Configure

    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {

        guard let sectionType = HomeSectionType(rawValue: indexPath.section) else {
            return UICollectionReusableView()
        }

        switch sectionType {
        case .banner:
            return UICollectionReusableView()
        case .categoryBoxMenu:
            return UICollectionReusableView()
        case .popularStudy:
            if kind == HomeSectionHeader.elementKind {
                guard let header = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: HomeSectionHeader.identifier,
                    for: indexPath
                ) as? HomeSectionHeader else {
                    assertionFailure("❌ HomeSectionHeader 캐스팅 실패")
                    return UICollectionReusableView()
                }
                header.configure(title: studyItemData[indexPath.item].title)
                return header
            }
        }
        return UICollectionReusableView()
    }
}
