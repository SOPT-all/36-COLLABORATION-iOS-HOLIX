//
//  BannerResponse.swift
//  HOLIX_iOS
//
//  Created by 정정욱 on 5/15/25.
//

import UIKit

struct BannerResponse {
    var Image: UIImage
}

extension BannerResponse {
    static func mockData() -> [BannerResponse] {
        return [
            BannerResponse(Image: ImageLiterals.home_thumnail_01),
            BannerResponse(Image: ImageLiterals.home_thumnail_02),
            BannerResponse(Image: ImageLiterals.home_thumnail_03),
            BannerResponse(Image: ImageLiterals.home_thumnail_04),
            BannerResponse(Image: ImageLiterals.home_thumnail_05),
            BannerResponse(Image: ImageLiterals.home_thumnail_06)
        ]
    }
}
