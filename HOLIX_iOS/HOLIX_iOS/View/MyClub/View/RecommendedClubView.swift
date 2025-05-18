//
//  RecommendedClubView.swift
//  HOLIX_iOS
//
//  Created by 쏘 on 5/16/25.
//

import UIKit

import SnapKit
import Then

final class RecommendedClubView: UIView {

    // MARK: - Properties

    private var itemData = RecommendedClubModel.dummy()
    private var cellHeight = CGFloat(55)
    private let recommendedLable = UILabel()

    // MARK: - UI Components

    private lazy var recommendedTableView = UITableView(
        frame: .zero,
        style: .plain
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

    // MARK: - SetUp

    private func setUI() {
        addSubviews(recommendedLable, recommendedTableView)
        recommendedTableView.register(RecommendedClubCell.self, forCellReuseIdentifier: RecommendedClubCell.identifier)
    }

    // MARK: - SetDelegate

    private func setDelegate() {
        recommendedTableView.delegate = self
        recommendedTableView.dataSource = self
    }

    // MARK: - SetStyle

    private func setStyle() {
        recommendedLable.do {
            $0.text = "추천"
            $0.textColor = .black
            $0.font = .pretendard(.title3_b_15)
        }

        recommendedTableView.do {
            $0.separatorStyle = .none
        }
    }

    // MARK: - SetLayout

    private func setLayout() {

        self.snp.makeConstraints {
            $0.edges.equalTo(safeAreaLayoutGuide)
        }

        recommendedLable.snp.makeConstraints {
            $0.leading.top.equalTo(safeAreaLayoutGuide)
            $0.width.equalTo(26)
            $0.height.equalTo(21)
        }

        recommendedTableView.snp.makeConstraints {
            $0.top.equalTo(recommendedLable.snp.bottom).offset(16)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(CGFloat(itemData.count) * cellHeight)
        }
    }
}

// MARK: - UITableView Delegate & DataSource
extension RecommendedClubView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemData.count
    }
}

extension RecommendedClubView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RecommendedClubCell.identifier, for: indexPath) as? RecommendedClubCell else { return UITableViewCell() }
        cell.dataBind(itemData[indexPath.row])

        return cell
    }
}
