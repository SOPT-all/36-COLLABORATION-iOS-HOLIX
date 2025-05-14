//
//  CustomNavigationBar.swift
//  HOLIX_iOS
//
//  Created by 임재현 on 5/14/25.
//

import UIKit
import SnapKit

protocol CustomNavigationBarDelegate: AnyObject {
    func didTapBackButton()
    func didTapSearchButton()
    func didTapMenuButton()
}

final class CustomNavigationBar: UIView {
    
    // MARK: - Properties
    
    private var haveMenuButton: Bool = false
    weak var delegate: CustomNavigationBarDelegate?
    
    // MARK: - UI Components
    
    private let backButton = UIButton()
    private let titleLabel = UILabel()
    private let searchButton = UIButton()
    private let menuButton = UIButton()
    private let buttonStackView = UIStackView()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(titleLabel: String = "", haveMenuButton: Bool) {
        super.init(frame: .zero)
        self.haveMenuButton = haveMenuButton
        self.titleLabel.text = titleLabel
        setupAddSubview()
        setupUI()
        setStyle()
        setAddTarget()
    }
    
    // MARK: - SetupAddSubview
    
    private func setupAddSubview() {
        [backButton,titleLabel,buttonStackView].forEach {
            self.addSubview($0)
        }
        
        self.buttonStackView.addArrangedSubview(searchButton)
        
        if haveMenuButton {
            self.buttonStackView.addArrangedSubview(menuButton)
            menuButton.snp.makeConstraints {
                $0.size.equalTo(30)
            }
        }
    }
    // MARK: - SetupUI
    
    private func setupUI() {
        backButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.size.equalTo(20)
            $0.centerY.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(self.backButton.snp.trailing).offset(16)
            $0.centerY.equalToSuperview()
        }
        
        buttonStackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        searchButton.snp.makeConstraints {
            $0.size.equalTo(30)
        }
    }
    
    // MARK: - SetStyle
    
    private func setStyle() {
        self.backgroundColor = .white
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor = .black
        
        titleLabel.textColor = .black
        titleLabel.font = .pretendard(size: 16)
        
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.tintColor = .black
        menuButton.setImage(UIImage(systemName: "line.3.horizontal"), for: .normal)
        menuButton.tintColor = .black
        
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        buttonStackView.spacing = 5
        
    }
    
    // MARK: - SetAddTarget
    
    private func setAddTarget() {
        backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
        searchButton.addTarget(self, action: #selector(searchButtonDidTap), for: .touchUpInside)
        menuButton.addTarget(self, action: #selector(menuButtonDidTap), for: .touchUpInside)

    }
    
    // MARK: - Button Actions
    
    @objc private func backButtonDidTap() {
        print("backButton 클릭됨")
        delegate?.didTapBackButton()
    }
    
    @objc private func searchButtonDidTap() {
        print("searchButton 클릭됨")
        delegate?.didTapSearchButton()
    }
    
    @objc private func menuButtonDidTap() {
        print("menuButton 클릭됨")
        delegate?.didTapMenuButton()
    }
}
