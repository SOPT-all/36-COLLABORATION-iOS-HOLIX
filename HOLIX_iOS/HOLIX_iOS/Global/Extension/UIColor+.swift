//
//  UIColor+.swift
//  HOLIX_iOS
//
//  Created by 임재현 on 5/14/25.
//

import UIKit

extension UIColor {
    static var main_blue = UIColor(hex: "#3269FF")
    static var light_blue = UIColor(hex: "#F3F4FF")
    static var blue = UIColor(hex: "#004BFB")
    static var skyblue = UIColor(hex: "#1ABFFB")
    static var lime = UIColor(hex: "#DEFF4E")
    static var green = UIColor(hex: "#34C759")
    static var background = UIColor(hex: "#434343",alpha: 0.3)
    static var alert_red = UIColor(hex: "#FF4040")
    static var light_red = UIColor(hex: "#FFEDED")
    static var gray01 = UIColor(hex: "#F5F5FB")
    static var gray02 = UIColor(hex: "#EEEEF4")
    static var gray03 = UIColor(hex: "#E0E0E6")
    static var gray04 = UIColor(hex: "#BDBDC3")
    static var gray05 = UIColor(hex: "#9E9EA4")
    static var gray06 = UIColor(hex: "#616167")
    static var gray07 = UIColor(hex: "#424248")
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }

        assert(hexFormatted.count == 6, "Invalid hex code used.")
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: alpha)
    }
}
