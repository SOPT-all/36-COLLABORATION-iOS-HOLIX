//
//  CustomTextView.swift
//  HOLIX_iOS
//
//  Created by 임재현 on 5/19/25.
//

import UIKit

import SnapKit
import Then

final class CustomTextView: UIView {
    
    // MARK: - Properties
    
    private var plusButtonTopConstraint: Constraint?
    private var sendButtonTopConstraint: Constraint?
    private var textViewHeightConstraint: Constraint?
    var onHeightChange: ((CGFloat) -> Void)?
   
    // MARK: - UI Components
    
    private let plusButton = UIButton()
    private let textView = UITextView()
    private let sendButton = UIButton()
    private let tagScrollView = UIScrollView()
    private let tagStackView = UIStackView()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setStyle()
        setLayout()
        textView.delegate = self
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetUI
    
    private func setUI() {
        self.addSubviews(plusButton,textView,sendButton,tagScrollView)
        tagScrollView.addSubview(tagStackView)
    }
    
    // MARK: - SetStyle
    
    private func setStyle() {
        
        plusButton.do {
            $0.setImage(.icAddCircleIos, for: .normal)
        }
        
        textView.do {
            $0.backgroundColor = .white
            $0.text = "텍스트를 입력해주세요"
            $0.font = .pretendard(.body3_r_15)
            $0.textColor = .placeholderText
            $0.isScrollEnabled = false
            $0.textContainerInset = UIEdgeInsets(top: 8, left: 4, bottom: 8, right: 4)

        }
        
        sendButton.do {
            $0.setImage(.icSendIos, for: .normal)
        }
        
        tagScrollView.do {
            $0.backgroundColor = .clear
            $0.showsVerticalScrollIndicator = true
            $0.showsHorizontalScrollIndicator = true
            $0.isScrollEnabled = true
            $0.bounces = true
            $0.clipsToBounds = true
            $0.isHidden = true
        }
        
        tagStackView.do {
            $0.backgroundColor = .clear
            $0.axis = .horizontal
            $0.spacing = 8
            $0.alignment = .fill
            $0.distribution = .equalSpacing
            $0.isHidden = true
        }
    }
    
    // MARK: - SetLayout
    
    private func setLayout() {
       
        plusButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.size.equalTo(21)
            plusButtonTopConstraint = $0.top.equalToSuperview().offset(10).constraint
        }

        
        textView.snp.makeConstraints {
            $0.leading.equalTo(plusButton.snp.trailing).offset(8)
            $0.trailing.equalToSuperview().inset(50)
            $0.top.equalToSuperview().offset(6)
            self.textViewHeightConstraint = $0.height.equalTo(40).constraint
            $0.width.equalTo(290)
        }
        
        sendButton.snp.makeConstraints {
            $0.leading.equalTo(textView.snp.trailing).offset(8)
            $0.top.equalToSuperview().offset(10)
            $0.size.equalTo(21)
        }
        
        tagScrollView.snp.makeConstraints {
            $0.leading.equalTo(plusButton.snp.trailing).offset(8)
            $0.trailing.equalTo(sendButton.snp.leading).offset(-8)
            $0.top.equalTo(textView.snp.bottom).offset(8)
            $0.bottom.equalToSuperview().inset(1)
            $0.height.equalTo(26)
        }
        
        tagStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(26)
        }
    }
}

// MARK: - UITextViewDelegate

extension CustomTextView: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .placeholderText {
            textView.textColor = .black
            textView.text = nil
        } else {
            return
        }
    }
        
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "텍스트를 입력해주세요"
            textView.textColor = .placeholderText
        }
    }

    func textViewDidChange(_ textView: UITextView) {
        let lineHeight = textView.font?.lineHeight ?? 0
        let maxHeight = lineHeight * 3 + textView.textContainerInset.top + textView.textContainerInset.bottom

        let width = textView.bounds.width > 0 ? textView.bounds.width : UIScreen.main.bounds.width - 50
        let estimatedSize = textView.sizeThatFits(CGSize(width: width, height: .infinity))
        
        let finalHeight = min(estimatedSize.height, maxHeight)

        textView.isScrollEnabled = estimatedSize.height > maxHeight
        textViewHeightConstraint?.update(offset: finalHeight)

        let topPadding: CGFloat = 10
        let bottomPadding: CGFloat = 10
        let contentHeight = max(finalHeight, 21)
        let totalHeight = topPadding + contentHeight + bottomPadding

        onHeightChange?(totalHeight)

        UIView.animate(withDuration: 0.1) {
            self.superview?.layoutIfNeeded()
        }
    }
}

// MARK: - Functions

extension CustomTextView {
    
    func movePlusButtonToBottom(_ move: Bool) {
        plusButtonTopConstraint?.deactivate()

        plusButton.snp.makeConstraints {
            if move {
                plusButtonTopConstraint = $0.top.equalTo(tagScrollView.snp.top).offset(6).constraint
                
                tagScrollView.isHidden = false
                tagStackView.isHidden = false
                
            } else {
                plusButtonTopConstraint = $0.top.equalToSuperview().offset(10).constraint
                tagScrollView.isHidden = true
                tagStackView.isHidden = true
            }
        }

        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }
    
    func addTag(title: String) {
           let tagView = TagListView(title: title)
           tagView.onTap = { [weak self, weak tagView] in
               guard let self, let tagView else { return }
               self.tagStackView.removeArrangedSubview(tagView)
               tagView.removeFromSuperview()
               self.updateTagVisibility()
           }

           tagStackView.addArrangedSubview(tagView)
           updateTagVisibility()
       }

       private func updateTagVisibility() {
           tagScrollView.isHidden = tagStackView.arrangedSubviews.isEmpty
       }
}
