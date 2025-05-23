//
//  ClubService.swift
//  HOLIX_iOS
//
//  Created by 임재현 on 5/22/25.
//

import Foundation

final class ClubChattingService {

    static let shared = ClubChattingService()

    func getClubDetail(clubId: String) async throws -> ClubDetailResponse {
        return try await APIService.shared.request(
            path: Endpoint.Club.getClubDetail(clubId: clubId).path,
            method: Endpoint.Club.getClubDetail(clubId: clubId).method,
            responseType: ClubDetailResponse.self)
    }
    
    func getClubChatting(clubId: String) async throws -> ClubChattingResponse {
        return try await APIService.shared.request(
            path: Endpoint.Club.getClubChat(clubId: clubId).path,
            method: Endpoint.Club.getClubChat(clubId: clubId).method,
            responseType: ClubChattingResponse.self)
    }
    
    func postClubChatting(clubId: String,contents:ChattingCreateRequestDTO) async throws -> PostChattingResponse {
        
        let requestBody = try JSONEncoder().encode(contents)
        
        return try await APIService.shared.request(
            path: Endpoint.Club.postClubChat(clubId: clubId).path,
            method: Endpoint.Club.postClubChat(clubId: clubId).method,
            body: requestBody,
            responseType: PostChattingResponse.self)
    }
}
