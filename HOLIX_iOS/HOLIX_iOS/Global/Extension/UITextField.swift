//
//  UITextField.swift
//  HOLIX_iOS
//
//  Created by 정정욱 on 5/18/25.
//

import UIKit

extension UITextField {
    // 텍스트필드 속 여백
    func addLeftPadding(_ width: CGFloat = 10) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
    func addRightPadding(_ width: CGFloat = 10) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.height))
        self.rightView = paddingView
        self.rightViewMode = ViewMode.always
    }
}

extension UITextField {
    // 텍스트필드 속 오른쪽 아이콘
    func setRightIcon(_ image: UIImage, padding: CGFloat = 12, size: CGSize = CGSize(width: 20, height: 20)) {
        let container = UIView(frame: CGRect(x: 0, y: 0, width: size.width + padding * 2, height: 40))
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: padding, y: (40 - size.height)/2, width: size.width, height: size.height)
        container.addSubview(imageView)
        self.rightView = container
        self.rightViewMode = .always
    }
}
