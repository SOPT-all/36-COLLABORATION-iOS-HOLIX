//
//  MyClubModel.swift
//  HOLIX_iOS
//
//  Created by 쏘 on 5/16/25.
//

import UIKit

struct MyClubModel {
    var thumbnail: UIImage
    var title: String
    var member: String
}

extension MyClubModel {
    static func dummy() -> [MyClubModel] {
        return [
            MyClubModel(thumbnail: .img1Ios, title: "💰디자이너로서 성공하고 싶은 사람들이 모인 방", member: "멤버 130명 / 500명"),
            MyClubModel(thumbnail: .img2Ios, title: "AI 도구 활용한 영상 만들기 질문답변방", member: "멤버 998명 / 1,000명"),
            MyClubModel(thumbnail: .img3Ios, title: "손글씨를 사랑하는 사람들의 모임", member: "멤버 130명 / 500명"),
            MyClubModel(thumbnail: .img4Ios, title: "UX Writing 실무 파헤치기", member: "멤버 130명 / 500명")
        ]
    }
}
