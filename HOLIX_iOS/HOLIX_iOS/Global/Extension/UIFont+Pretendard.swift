//
//  UIFont+Pretendard.swift
//  HOLIX_iOS
//
//  Created by 쏘 on 5/13/25.
//

import UIKit

extension UIFont {
    
    enum Family: String {
        case Black, Bold, ExtraBold, ExtraLight, Light, Medium, Regular, Semibold, Thin
    }
    
    static func pretendard(size: CGFloat, weight: Family = .Regular) -> UIFont {
        if let font = UIFont(name: "Pretendard-\(weight.rawValue)", size: size) {
            return font
        } else {
            print("Pretendard-\(weight.rawValue) loading failed, fallback to system font")
            return .systemFont(ofSize: size)
        }
    }
}
