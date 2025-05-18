//
//  CategoryBoxMenuResponse.swift
//  HOLIX_iOS
//
//  Created by 정정욱 on 5/18/25.
//

import UIKit

struct CategoryBoxMenuResponse {
    var Image: UIImage
    var name: String
}

extension CategoryBoxMenuResponse {
    static func mockData() -> [CategoryBoxMenuResponse] {
        return [
            CategoryBoxMenuResponse(Image: ImageLiterals.home_category_01, name: "커리어"),
            CategoryBoxMenuResponse(Image: ImageLiterals.home_category_02, name: "재테크"),
            CategoryBoxMenuResponse(Image: ImageLiterals.home_category_03, name: "자기계발"),
            CategoryBoxMenuResponse(Image: ImageLiterals.home_category_04, name: "학업")
        ]
    }
}
