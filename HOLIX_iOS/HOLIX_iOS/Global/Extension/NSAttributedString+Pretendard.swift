//
//  NSAttributedString+Pretendard.swift
//  HOLIX_iOS
//
//  Created by 쏘 on 5/14/25.
//

import UIKit

extension NSAttributedString {

    static func pretendard(_ style: UIFont.PretendardStyle, text: String) -> NSAttributedString {
        let font = UIFont.pretendard(style)
        let paragraph = NSMutableParagraphStyle()

        switch style {
        case .title1_b_17, .title2_sb_15:
            paragraph.lineHeightMultiple = 1.3
        default:
            paragraph.lineHeightMultiple = 1.4
        }

        return NSAttributedString(string: text, attributes: [
            .font: font,
            .paragraphStyle: paragraph
        ])
    }

}

