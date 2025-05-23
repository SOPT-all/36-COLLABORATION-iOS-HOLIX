//
//  TagView.swift
//  HOLIX_iOS
//
//  Created by 임재현 on 5/19/25.
//

import UIKit

import SnapKit
import Then

final class TagListView: UIView {

    // MARK: - Properties
    
    var onTap: (() -> Void)?

    // MARK: - UI Components

    private let tagButton = UIButton()

    // MARK: - Lifecycle

    init(title: String) {
        super.init(frame: .zero)
        tagButton.setTitle("# \(title)", for: .normal)
        setUI()
        setStyle()
        setLayout()
        setupAction()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - SetUI

    private func setUI() {
        addSubview(tagButton)
    }

    // MARK: - SetStyle

    private func setStyle() {
        tagButton.do {
            $0.titleLabel?.font = .pretendard(.body7_r_13)
            $0.setTitleColor(.black, for: .normal)
            $0.contentEdgeInsets = UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8)
            $0.layer.cornerRadius = 4
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.gray03.cgColor
            $0.backgroundColor = .white
            $0.isEnabled = false
        }
    }

    // MARK: - SetLayout

    private func setLayout() {
        tagButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    // MARK: - SetupAction

    private func setupAction() {
        tagButton.addTarget(self, action: #selector(tagButtonDidTap), for: .touchUpInside)
    }

    @objc private func tagButtonDidTap() {
        onTap?()
    }
}
