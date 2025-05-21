//
//  StudyResponse.swift
//  HOLIX_iOS
//
//  Created by 정정욱 on 5/19/25.
//

import Foundation

// MARK: - 전체 응답 객체

struct StudyResponse: Codable {
    let code: Int
    let message: String
    let data: StudyData
}

// MARK: - data 하위

struct StudyData: Codable {
    let passionateStudies: [Study]
    let insightStudies: [Study]
    let newStudies: [Study]
    let recommendedStudies: [Study]
    let freeStudies: [Study]
}

// MARK: - 개별 스터디 정보

struct Study: Codable {
    let studyId: Int
    let studyTitle: String
    let studyLeader: String
    let price: String
    let url: String
    let tags: [Tag]
    let category: String
}

// MARK: - 태그

struct Tag: Codable {
    let tagId: Int
    let tagName: String
    let tagColor: String
}
