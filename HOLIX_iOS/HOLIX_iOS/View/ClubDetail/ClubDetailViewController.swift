//
//  ClubDetailViewController.swift
//  HOLIX_iOS
//
//  Created by 임재현 on 5/15/25.
//

import UIKit

import SnapKit
import Then

final class ClubDetailViewController: UIViewController {
    
    // MARK: - UI Components
    private let customNavigationBar = CustomNavigationBar(hasMenuButton: false)
    private let iconImageView = UIImageView()
    private let clubInfoView = ClubInfoView()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setStyle()
        setLayout()
        self.view.backgroundColor = .clubHomeBackground
    }
    
    // MARK: - SetUI
    
    private func setUI() {
        self.view.addSubviews(customNavigationBar,iconImageView,clubInfoView)
        customNavigationBar.layer.zPosition = 1

    }
    
    // MARK: - SetStyle
    
    private func setStyle() {
        iconImageView.do {
            $0.image = UIImage(named: "img_1_ios")
            $0.contentMode = .scaleAspectFit
            $0.backgroundColor = .clubHomeBackground
        }
        
        customNavigationBar.do {
            $0.backgroundColor = .clubHomeBackground
            $0.tintColor = .white
        }
        
        clubInfoView.do {
            $0.layer.cornerRadius = 20
            $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            $0.layer.masksToBounds = true
            
        }

    }
    
    // MARK: - SetLayout
    
    private func setLayout() {
        customNavigationBar.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        iconImageView.snp.makeConstraints {
            //$0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.top.equalTo(self.customNavigationBar.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(200)
            
        }
        
        clubInfoView.snp.makeConstraints {
            $0.top.equalTo(iconImageView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}
