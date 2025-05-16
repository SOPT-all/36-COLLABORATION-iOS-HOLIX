//
//  ClubInfoView.swift
//  HOLIX_iOS
//
//  Created by 임재현 on 5/15/25.
//

import UIKit

import SnapKit
import Then

final class ClubInfoView: UIView {
    
    // MARK: - Properties
    
    let imageNames = ["ic_club_category_ios_calendar",
                      "ic_club_category_ios_mentoring",
                      "ic_club_category_ios_class",
                      "ic_club_category_ios_quiz"]
    
    let labelTexts = ["모임", "멘토링", "클래스", "퀴즈"]
    
    // MARK: - UI Components

    private let titleLabel = UILabel()
    private let memberIcon = UIImageView()
    private let memberLabel = UILabel()
    private let memberStackView = UIStackView()
    private let noticeButton = NoticeButton()
    private let horizontalDividerView = DividerView(height: 6,axis: .horizontal)
    private lazy var horiziontalStackView = UIStackView()
    private let enterButton = UIButton()
    private let speechBubble = UIImageView()
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = .red
        setUI()
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetUI
    
    private func setUI() {
        self.addSubviews(titleLabel,memberIcon,memberLabel,noticeButton,horizontalDividerView,horiziontalStackView,
                         enterButton,speechBubble)

    }
    
    // MARK: - SetStyle
    
    private func setStyle() {
        titleLabel.do {
            $0.text = "💰 디자이너로서 성공하고 싶은 사람들이 모인 방"
            $0.textColor = .black
            $0.font = .pretendard(.title3_b_15)
        }
        
        memberIcon.do {
            $0.image = UIImage(named: "ic_chatting_menu_ios_member")
            $0.tintColor = .lightGray
        }
        
        memberLabel.do {
            $0.text = "멤버 130명 / 500명"
            $0.textColor = .gray05
            $0.font = .pretendard(.label3_r_11)
        }
        
        noticeButton.do {
            $0.backgroundColor = .light_blue
        }
        
        horiziontalStackView.do {
            $0.axis = .horizontal
            $0.alignment = .fill
            $0.distribution = .equalSpacing
            $0.spacing = 0
        }
        
        enterButton.do {
            $0.backgroundColor = .main_blue
            $0.setTitle("채팅 입장하기", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = .pretendard(.title1_b_17)
        }
        
        speechBubble.do {
            $0.backgroundColor = .clear
            $0.image = UIImage(named: "speech_bubble_ios")
        }

       
    }
    
    // MARK: - SetLayout
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(20)
        }
        
        memberIcon.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.top.equalTo(titleLabel.snp.bottom).offset(12)
            $0.size.equalTo(20)
        }
        
        memberLabel.snp.makeConstraints {
            $0.centerY.equalTo(memberIcon)
            $0.leading.equalTo(memberIcon.snp.trailing).offset(8)
        }
        
        noticeButton.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(memberIcon.snp.bottom).offset(8)
            $0.height.equalTo(46)
        }
        
        horizontalDividerView.snp.makeConstraints {
            $0.top.equalTo(noticeButton.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
        }
        
        horiziontalStackView.snp.makeConstraints {
            $0.top.equalTo(horizontalDividerView.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
            
        }
        
        for i in 0..<4 {
            let verticalStackView = createVerticalStackView(index: i, imageNames: imageNames, labelTexts: labelTexts)
            horiziontalStackView.addArrangedSubview(verticalStackView)
            
            if i < 3 {
                let divier = DividerView(backgroundColor: .light_blue,height: 1.0,axis: .vertical)
                horiziontalStackView.addArrangedSubview(divier)
                
                divier.snp.makeConstraints {
                    $0.height.equalTo(30)
                }
            }
        }
        
        enterButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(80)
        }
        
        speechBubble.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.bottom.equalTo(enterButton.snp.top)
            $0.width.equalTo(233)
            $0.height.equalTo(49)
        }
        
        
    }
    
    private func createVerticalStackView(index: Int,imageNames:[String],labelTexts:[String]) -> UIStackView {
        let stackView = UIStackView().then {
            $0.axis = .vertical
            $0.alignment = .center
            $0.distribution = .fill
            $0.spacing = 0
        }
        
        let imageName = index < imageNames.count ? imageNames[index] : ""
        let labelText = index < labelTexts.count ? labelTexts[index] : "아이템"
        
        let imageView = UIImageView().then {
            if !imageName.isEmpty {
                $0.image = UIImage(named: imageName)
            }
            $0.backgroundColor = .clear
            $0.contentMode = .scaleAspectFit
        }
        
        let label = UILabel().then {
            $0.text = labelText
            $0.textAlignment = .center
            $0.font = .pretendard(.label2_m_11)
        }
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
        
        imageView.snp.makeConstraints {
            $0.width.height.equalTo(24)
        }
        
        stackView.snp.makeConstraints {
            $0.width.equalTo(80)
        }

        return stackView
    }
}

