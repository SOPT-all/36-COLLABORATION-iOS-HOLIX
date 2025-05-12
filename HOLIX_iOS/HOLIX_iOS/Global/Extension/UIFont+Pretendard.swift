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
            return UIFont(name: "Pretendard-\(weight.rawValue)", size: size)!
    }
}
