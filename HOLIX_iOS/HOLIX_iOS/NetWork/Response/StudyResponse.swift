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

/*
 컨피그 git ignore에 넣어야 하는데 이거 관리를 어떻게 하는지
 서버분한테 뭐가 맞는지 연락 한번 드리기 ok
 포스트맨 한번 찍어보자
 */
