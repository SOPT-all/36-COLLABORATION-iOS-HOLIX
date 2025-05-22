//
//  HomeService.swift
//  HOLIX_iOS
//
//  Created by 정정욱 on 5/19/25.
//

import Foundation

final class HomeService {

    static let shared = HomeService()

    func getMain() async throws -> StudyData {
        return try await APIService.shared.request(
            path: Endpoint.Main.getMain.path,
            method: Endpoint.Main.getMain.method,
            responseType: StudyResponse.self).data
    }
}
