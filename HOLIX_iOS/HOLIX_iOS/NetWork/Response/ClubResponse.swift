//
//  ClubResponse.swift
//  HOLIX_iOS
//
//  Created by 쏘 on 5/22/25.
//

import Foundation

// MARK: - ClubResponse

struct ClubResponse: Codable {
    let code: Int
    let message: String
    let data: ClubData
}

// MARK: - ClubData

struct ClubData: Codable {
    let clubs: [Club]
}

// MARK: - Club

struct Club: Codable {
    let clubId: Int
    let title: String
    let isPinned: Bool
    let url: String
    let participants: String
}

