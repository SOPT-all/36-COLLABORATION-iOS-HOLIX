//
//  RecommendedClubModel.swift
//  HOLIX_iOS
//
//  Created by 쏘 on 5/16/25.
//

import UIKit

struct RecommendedClubModel {
    var thumbnail: UIImage
    var title: String
    var host: String
    var member: String
    var status: String
}

extension RecommendedClubModel {
    static func dummy() -> [RecommendedClubModel] {
        return [
            RecommendedClubModel(thumbnail: .imgMyClub1Ios, title: "UI/UX 원칙&UX 분석 Case Study - 매일 업로드", host: "전민수", member: "멤버 975명 / 1,000명", status: "모집중"),
            RecommendedClubModel(thumbnail: .imgMyClub2Ios, title: "데일리 디자인 정보 공유 세션", host: "이선주", member: "멤버 975명 / 1,000명", status: "모집중"),
            RecommendedClubModel(thumbnail: .imgMyClub3Ios, title: "피그마 학습방 : 서비스 기획자와 함께해요!", host: "기획자 김로리", member: "멤버 1,000명 / 1,000명", status: "마감"),
            RecommendedClubModel(thumbnail: .imgMyClub1Ios, title: "UI/UX 원칙&UX 분석 Case Study - 매일 업로드", host: "전민수", member: "멤버 975명 / 1,000명", status: "모집중"),
            RecommendedClubModel(thumbnail: .imgMyClub2Ios, title: "데일리 디자인 정보 공유 세션", host: "이선주", member: "멤버 975명 / 1,000명", status: "모집중"),
            RecommendedClubModel(thumbnail: .imgMyClub3Ios, title: "피그마 학습방 : 서비스 기획자와 함께해요!", host: "기획자 김로리", member: "멤버 1,000명 / 1,000명", status: "마감")
        ]
    }
}
