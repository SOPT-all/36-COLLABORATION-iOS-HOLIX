//
//  ChattingMockData.swift
//  HOLIX_iOS
//
//  Created by 임재현 on 5/16/25.
//

import Foundation

//struct ChattingResponseDTO {
//    let chattingId: Int
//    let clubId: Int
//    let userName: String
//    let introduction: String
//    let imageUrl: String
//    let contents: String
//    let likes: Int
//    let chattingType: ChattingType
//    let isMine: Bool
//    let createdAt: Date
//}
//
//
//
//final class DummyChattingData {
//    static func generate() -> [ChattingResponseDTO] {
//        let formatter = ISO8601DateFormatter()
//        formatter.formatOptions = [.withFullDate, .withTime, .withDashSeparatorInDate, .withColonSeparatorInTime]
//
//        return [
//            ChattingResponseDTO(
//                chattingId: 1,
//                clubId: 1,
//                userName: "임재현",
//                introduction: "저는 임재현입니다.",
//                imageUrl: "https://example.com/img2.png",
//                contents: "안녕하세요!",
//                likes: 0,
//                chattingType: .user,
//                isMine: false,
//                createdAt: formatter.date(from: "2024-05-13T15:00:00")!
//            ),
//            ChattingResponseDTO(
//                chattingId: 2,
//                clubId: 1,
//                userName: "박보영",
//                introduction: "저는 박보영입니다.",
//                imageUrl: "https://example.com/img3.jpg",
//                contents: "반갑습니다~",
//                likes: 0,
//                chattingType: .user,
//                isMine: false,
//                createdAt: formatter.date(from: "2024-05-13T15:01:00")!
//            ),
//            ChattingResponseDTO(
//                chattingId: 3,
//                clubId: 1,
//                userName: "아이유",
//                introduction: "저는 아이유입니다..",
//                imageUrl: "https://example.com/img1.png",
//                contents: "스터디는 언제 하나요?",
//                likes: 0,
//                chattingType: .user,
//                isMine: true,
//                createdAt: formatter.date(from: "2024-05-13T15:02:00")!
//            ),
//            ChattingResponseDTO(
//                chattingId: 4,
//                clubId: 1,
//                userName: "김솝트",
//                introduction: "저는 김솝트입니다.",
//                imageUrl: "https://example.com/img4.jpg",
//                contents: "김솝트님이 입장했습니다.",
//                likes: 0,
//                chattingType: .system,
//                isMine: false,
//                createdAt: formatter.date(from: "2024-05-13T15:03:00")!
//            ),
//            ChattingResponseDTO(
//                chattingId: 5,
//                clubId: 1,
//                userName: "카리나",
//                introduction: "저는 카리나입니다..",
//                imageUrl: "https://example.com/img1.png",
//                contents: "김솝트님 반갑습니다!",
//                likes: 0,
//                chattingType: .user,
//                isMine: true,
//                createdAt: formatter.date(from: "2024-05-13T15:04:00")!
//            ),
//            ChattingResponseDTO(
//                chattingId: 6,
//                clubId: 1,
//                userName: "김솝트",
//                introduction: "저는 김솝트입니다.",
//                imageUrl: "https://example.com/img4.jpg",
//                contents: "반갑습니다!",
//                likes: 0,
//                chattingType: .user,
//                isMine: false,
//                createdAt: formatter.date(from: "2024-05-13T15:05:00")!
//            ),
//            ChattingResponseDTO(
//                chattingId: 7,
//                clubId: 1,
//                userName: "임재현",
//                introduction: "저는 임재현입니다..",
//                imageUrl: "https://example.com/img1.png",
//                contents: "채팅 추가!",
//                likes: 0,
//                chattingType: .user,
//                isMine: true,
//                createdAt: formatter.date(from: "2025-05-13T06:06:51.963861")!
//            ),
//            ChattingResponseDTO(
//                chattingId: 8,
//                clubId: 1,
//                userName: "임재현",
//                introduction: "저는 임재현입니다..",
//                imageUrl: "https://example.com/img1.png",
//                contents: "채팅 추가!",
//                likes: 0,
//                chattingType: .user,
//                isMine: true,
//                createdAt: formatter.date(from: "2025-05-13T06:06:51.963861")!
//            ),
//            ChattingResponseDTO(
//                chattingId: 9,
//                clubId: 1,
//                userName: "임재현",
//                introduction: "저는 임재현입니다..",
//                imageUrl: "https://example.com/img1.png",
//                contents: "채팅 추가!",
//                likes: 0,
//                chattingType: .user,
//                isMine: true,
//                createdAt: formatter.date(from: "2025-05-13T06:06:51.963861")!
//            ),
//            ChattingResponseDTO(
//                chattingId: 10,
//                clubId: 1,
//                userName: "임재현",
//                introduction: "저는 임재현입니다..",
//                imageUrl: "https://example.com/img1.png",
//                contents: "채팅 추가!김솝트님 반갑습니다!김솝트님 반갑습니다!김솝트님 반갑습니다!김솝트님 반갑습니다!김솝트님 반갑습니다!김솝트님 반갑습니다!",
//                likes: 0,
//                chattingType: .user,
//                isMine: false,
//                createdAt: formatter.date(from: "2025-05-13T06:06:51.963861")!
//            ),
//            ChattingResponseDTO(
//                chattingId: 11,
//                clubId: 1,
//                userName: "임재현",
//                introduction: "저는 임재현입니다..",
//                imageUrl: "https://example.com/img1.png",
//                contents: "채팅 추가!",
//                likes: 0,
//                chattingType: .user,
//                isMine: true,
//                createdAt: formatter.date(from: "2025-05-13T06:06:51.963861")!
//            ),
//            ChattingResponseDTO(
//                chattingId: 12,
//                clubId: 1,
//                userName: "임재현",
//                introduction: "저는 임재현입니다..",
//                imageUrl: "https://example.com/img1.png",
//                contents: "채팅 추가!",
//                likes: 0,
//                chattingType: .user,
//                isMine: true,
//                createdAt: formatter.date(from: "2025-05-13T06:06:51.963861")!
//            )
//        ]
//    }
//}

