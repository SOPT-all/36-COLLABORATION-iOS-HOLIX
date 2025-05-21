//
//  HomeItemResponse.swift
//  HOLIX_iOS
//
//  Created by 정정욱 on 5/18/25.
//

import UIKit

struct StudyItemModel: Hashable {
    let studyId: Int
    let studyTitle: String
    let studyLeader: String
    let price: String
    //let url: String
    let image: UIImage
    let tags: [TagModel]
    let category: String
}

struct TagModel: Hashable {
    let tagId: Int
    let tagName: String
    let tagColor: String
}

struct StudySectionModel: Hashable {
    let title: String
    let items: [StudyItemModel]
}

extension StudyItemModel {
    static func mockData() -> [StudySectionModel] {
        let tagList: [TagModel] = [
            .init(tagId: 1, tagName: "온라인", tagColor: "blue"),
            .init(tagId: 2, tagName: "스터디", tagColor: "black"),
            .init(tagId: 3, tagName: "챌린지", tagColor: "blue"),
            .init(tagId: 4, tagName: "북클럽", tagColor: "black")
        ]

        let section1 = StudySectionModel(
            title: "활발한 스터디에 참여해보세요 🔥",
            items: [
                StudyItemModel(
                    studyId: 1,
                    studyTitle: "최정문 북클럽 - 과학으로 가는 문(과학,수학, 공학, SF 독서클럽)",
                    studyLeader: "레오",
                    price: "매월 9,900원",
                    image: ImageLiterals.class_01,
                    tags: [tagList[0], tagList[2]],
                    category: "활발한 스터디에 참여해보세요 🔥"
                ),
                StudyItemModel(
                    studyId: 2,
                    studyTitle: "iOS 앱 개발 챌린지",
                    studyLeader: "정욱",
                    price: "매월 10,900원",
                    image: ImageLiterals.class_02,
                    tags: [tagList[0], tagList[1]],
                    category: "활발한 스터디에 참여해보세요 🔥"
                ),
                StudyItemModel(
                    studyId: 3,
                    studyTitle: "안드로이드 스터디",
                    studyLeader: "최정문",
                    price: "매월 11,900원",
                    image: ImageLiterals.class_04,
                    tags: [tagList[0], tagList[2]],
                    category: "활발한 스터디에 참여해보세요 🔥"
                ),
                StudyItemModel(
                    studyId: 4,
                    studyTitle: "연극 스터디",
                    studyLeader: "최정문",
                    price: "매월 11,900원",
                    image: ImageLiterals.class_05,
                    tags: [tagList[0], tagList[1]],
                    category: "활발한 스터디에 참여해보세요 🔥"
                ),
                StudyItemModel(
                    studyId: 5,
                    studyTitle: "안드로이드 스터디",
                    studyLeader: "최정문",
                    price: "매월 11,900원",
                    image: ImageLiterals.class_06,
                    tags: [tagList[0], tagList[3]],
                    category: "활발한 스터디에 참여해보세요 🔥"
                )
            ]
        )

        let section2 = StudySectionModel(
            title: "북클럽과 세미나로 인사이트 충전 💡",
            items: [
                StudyItemModel(
                    studyId: 201,
                    studyTitle: "기획자 독서 세미나",
                    studyLeader: "민수",
                    price: "매월 10,900원",
                    image: ImageLiterals.class_04,
                    tags: [tagList[3], tagList[1]],
                    category: "북클럽과 세미나로 인사이트 충전 💡"
                ),
                StudyItemModel(
                    studyId: 202,
                    studyTitle: "AI 시대의 독서법",
                    studyLeader: "Jordan",
                    price: "매월 11,900원",
                    image: ImageLiterals.class_05,
                    tags: [tagList[0], tagList[3]],
                    category: "북클럽과 세미나로 인사이트 충전 💡"
                )
            ]
        )

        let section3 = StudySectionModel(
            title: "새로 올라온 강의",
            items: [
                StudyItemModel(
                    studyId: 301,
                    studyTitle: "Swift로 배우는 알고리즘",
                    studyLeader: "정욱",
                    price: "매월 13,900원",
                    image: ImageLiterals.class_06,
                    tags: [tagList[0], tagList[1]],
                    category: "새로 올라온 강의",
                ),
                StudyItemModel(
                    studyId: 302,
                    studyTitle: "디자이너를 위한 마케팅 기초",
                    studyLeader: "레오",
                    price: "매월 9,900원",
                    image: ImageLiterals.class_07,
                    tags: [tagList[0], tagList[2]],
                    category: "새로 올라온 강의",
                )
            ]
        )

        return [section1, section2, section3]
    }
}
