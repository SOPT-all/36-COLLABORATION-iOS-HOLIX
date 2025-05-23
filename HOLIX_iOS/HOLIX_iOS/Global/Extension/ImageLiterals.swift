//
//  ImageLiterals.swift
//  HOLIX_iOS
//
//  Created by 정정욱 on 5/13/25.
//

import UIKit

enum ImageLiterals {
    static var home_category_01: UIImage { .load(name: "home_category_icon_01") }
    static var home_category_02: UIImage { .load(name: "home_category_icon_02") }
    static var home_category_03: UIImage { .load(name: "home_category_icon_03") }
    static var home_category_04: UIImage { .load(name: "home_category_icon_04") }

    static var img_1: UIImage { .load(name: "img_1_ios") }
    static var img_2: UIImage { .load(name: "img_2_ios") }
    static var img_3: UIImage { .load(name: "img_3_ios") }

    static var banner: UIImage { .load(name: "img_banner_ios") }
    static var banner_thumbnail: UIImage { .load(name: "img_banner_thumbnail_ios") }
    static var club_main: UIImage { .load(name: "img_club_main_ios") }

    static var club_photo_01: UIImage { .load(name: "img_club_photo_1_ios") }
    static var club_photo_02: UIImage { .load(name: "img_club_photo_2_ios") }
    static var club_photo_03: UIImage { .load(name: "img_club_photo_3_ios") }
    static var club_photo_04: UIImage { .load(name: "img_club_photo_4_ios") }

    static var class_01: UIImage { .load(name: "img_class_ios_01") }
    static var class_02: UIImage { .load(name: "img_class_ios_02") }
    static var class_03: UIImage { .load(name: "img_class_ios_03") }
    static var class_04: UIImage { .load(name: "img_class_ios_04") }
    static var class_05: UIImage { .load(name: "img_class_ios_05") }
    static var class_06: UIImage { .load(name: "img_class_ios_06") }
    static var class_07: UIImage { .load(name: "img_class_ios_07") }
    static var class_08: UIImage { .load(name: "img_class_ios_08") }
    static var class_09: UIImage { .load(name: "img_class_ios_09") }
    static var class_10: UIImage { .load(name: "img_class_ios_10") }

    static var home_thumnail_01: UIImage { .load(name: "img_home_thumnail_ios_01") }
    static var home_thumnail_02: UIImage { .load(name: "img_home_thumnail_ios_02") }
    static var home_thumnail_03: UIImage { .load(name: "img_home_thumnail_ios_03") }
    static var home_thumnail_04: UIImage { .load(name: "img_home_thumnail_ios_04") }
    static var home_thumnail_05: UIImage { .load(name: "img_home_thumnail_ios_05") }
    static var home_thumnail_06: UIImage { .load(name: "img_home_thumnail_ios_06") }

    static var my_club_01: UIImage { .load(name: "img_my_club_1_ios") }
    static var my_club_02: UIImage { .load(name: "img_my_club_2_ios") }
    static var my_club_03: UIImage { .load(name: "img_my_club_3_ios") }
    static var my_club_04: UIImage { .load(name: "img_my_club_4_ios") }
    static var my_club_05: UIImage { .load(name: "img_my_club_5_ios") }
    static var my_club_06: UIImage { .load(name: "img_my_club_6_ios") }

    static var profile_noraml_01: UIImage { .load(name: "img_profile_noraml_ios_01") }
    static var profile_noraml_02: UIImage { .load(name: "img_profile_noraml_ios_02") }
    static var profile_noraml_03: UIImage { .load(name: "img_profile_noraml_ios_03") }
    static var profile_noraml_04: UIImage { .load(name: "img_profile_noraml_ios_04") }
    static var profile_noraml_05: UIImage { .load(name: "img_profile_noraml_ios_05") }
    static var profile_noraml_06: UIImage { .load(name: "img_profile_noraml_ios_06") }
    static var profile_noraml_07: UIImage { .load(name: "img_profile_noraml_ios_07") }
    static var profile_noraml_08: UIImage { .load(name: "img_profile_noraml_ios_08") }

    static var pagebutton_01: UIImage { .load(name: "pagebutton_ios_01") }
    static var pagebutton_02: UIImage { .load(name: "pagebutton_ios_02") }
    static var pagebutton_03: UIImage { .load(name: "pagebutton_ios_03") }
    static var pagebutton_04: UIImage { .load(name: "pagebutton_ios_04") }
    static var pagebutton_05: UIImage { .load(name: "pagebutton_ios_05") }
    static var pagebutton_06: UIImage { .load(name: "pagebutton_ios_06") }
    
    static var ic_search_white_ios: UIImage { .load(name: "ic_search_white_ios") }
    static var ic_hambeger_ios: UIImage { .load(name: "ic_hambeger_ios") }
    
}

extension UIImage {
    static func load(name: String) -> UIImage {
        guard let image = UIImage(named: name, in: nil, compatibleWith: nil) else {
            return UIImage()
        }
        return image
    }


    static func load(systemName: String) -> UIImage {
        guard let image = UIImage(systemName: systemName, compatibleWith: nil) else {
            return UIImage()
        }
        return image
    }
}
