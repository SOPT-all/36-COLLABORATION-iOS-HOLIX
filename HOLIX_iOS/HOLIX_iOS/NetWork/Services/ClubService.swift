//
//  ClubService.swift
//  HOLIX_iOS
//
//  Created by 쏘 on 5/22/25.
//

import Foundation

final class ClubService {

    static let shared = ClubService()

    func getClub() async throws -> ClubResponse {
        return try await APIService.shared.request(
            path: Endpoint.Club.getMyClubs.path,
            method: Endpoint.Club.getMyClubs.method,
            responseType: ClubResponse.self)
    }
}
