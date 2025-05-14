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

    static func pretendard(weight: Family = .Regular, size: CGFloat) -> UIFont {
        if let font = UIFont(name: "Pretendard-\(weight.rawValue)", size: size) {
            return font
        } else {
            print("Pretendard-\(weight.rawValue) loading failed, fallback to system font")
            return .systemFont(ofSize: size)
        }
    }

    enum PretendardStyle {
        case title1_b_17
        case title2_sb_15
        case title3_b_15
        case body1_sb_15
        case body2_m_15
        case body3_r_15
        case body4_b_13
        case body5_sb_13
        case body6_m_13
        case body7_r_13
        case label1_b_11
        case label2_m_11
        case label3_r_11
        case label4_m_9
    }

    static func pretendard(_ style: PretendardStyle) -> UIFont {
        switch style {
        case .title1_b_17: return .pretendard(weight: .Bold, size: 17)
        case .title2_sb_15: return .pretendard(weight: .Semibold, size: 15)
        case .title3_b_15: return .pretendard(weight: .Bold, size: 15)
        case .body1_sb_15: return .pretendard(weight: .Semibold, size: 15)
        case .body2_m_15: return .pretendard(weight: .Medium, size: 15)
        case .body3_r_15: return .pretendard(weight: .Regular, size: 15)
        case .body4_b_13: return .pretendard(weight: .Bold, size: 13)
        case .body5_sb_13: return .pretendard(weight: .Semibold, size: 13)
        case .body6_m_13: return .pretendard(weight: .Medium, size: 13)
        case .body7_r_13: return .pretendard(weight: .Regular, size: 13)
        case .label1_b_11: return .pretendard(weight: .Bold, size: 11)
        case .label2_m_11: return .pretendard(weight: .Medium, size: 11)
        case .label3_r_11: return .pretendard(weight: .Regular, size: 11)
        case .label4_m_9: return .pretendard(weight: .Medium, size: 9)
        }
    }

}
