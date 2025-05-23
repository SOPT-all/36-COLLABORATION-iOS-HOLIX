//
//  ClubChattingResponse.swift
//  HOLIX_iOS
//
//  Created by 임재현 on 5/23/25.
//

import Foundation

// MARK: - ClubChattingResponse

struct ClubChattingResponse: Codable {
    let code: Int
    let message: String
    let data: ClubChattingData
}

// MARK: - ClubChattingData

struct ClubChattingData: Codable {
    let chattingList: [Chatting]
}

// MARK: - Chatting

struct Chatting: Codable {
    let chattingId: Int
    let clubId: Int
    let userName: String
    let introduction: String
    let imageUrl: String
    let contents: String
    let likes: Int
    let chattingType: String
    let isMine: Bool
    let createdAt: String

    var formattedCreatedAt: String {
        let formats = [
            "yyyy-MM-dd'T'HH:mm:ss.SSSSSS",
            "yyyy-MM-dd'T'HH:mm:ss"
        ]
        
        for format in formats {
            let formatter = DateFormatter()
            formatter.dateFormat = format
            formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter.timeZone = TimeZone(secondsFromGMT: 0)
            
            if let date = formatter.date(from: createdAt) {
                let displayFormatter = DateFormatter()
                displayFormatter.dateFormat = "HH:mm"
                displayFormatter.locale = Locale(identifier: "ko_KR")
                displayFormatter.timeZone = TimeZone.current
                return displayFormatter.string(from: date)
            }
        }
        print("날짜 파싱 실패: \(createdAt)")
        return "-"
    }
}

enum ChattingType: String {
    case user = "USER"
    case system = "SYSTEM"
}
