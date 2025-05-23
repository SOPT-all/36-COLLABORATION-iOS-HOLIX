//
//  ClubDetailResponse.swift
//  HOLIX_iOS
//
//  Created by 임재현 on 5/22/25.
//

import Foundation

// MARK: - ClubDetailResponse

struct ClubDetailResponse: Codable {
    let code: Int
    let message: String
    let data: ClubDetailData
}

// MARK: - ClubDetailData

struct ClubDetailData: Codable {
    let clubId: Int
    let title: String
    let url: String
    let participants: String
    let notice: String
}
