//
//  Endpoint.swift
//  HOLIX_iOS
//
//  Created by 정정욱 on 5/19/25.
//

import Foundation

enum Endpoint {

    // MARK: - Main

    enum Main {
        case getMain

        var path: String {
            switch self {
            case .getMain:
                return "/api/v1/main"
            }
        }

        var method: HTTPMethod {
            switch self {
            case .getMain:
                return .GET
            }
        }
    }

    // MARK: - Club

    enum Club {
        case getMyClubs
        case getClubDetail(clubId: String)
        case getClubChat(clubId: String)
        case postClubChat(clubId: String)
        case patchClubBookmark(clubId: String)

        var path: String {
            switch self {
            case .getMyClubs:
                return "/api/v1/club"

            case .getClubDetail(let clubId):
                return "/api/v1/club/\(clubId)"

            case .getClubChat(let clubId),
                 .postClubChat(let clubId):
                return "/api/v1/club/\(clubId)/chat"

            case .patchClubBookmark(let clubId):
                return "/api/v1/club/\(clubId)/bookmark"
            }
        }

        var method: HTTPMethod {
            switch self {
            case .getMyClubs,
                 .getClubDetail,
                 .getClubChat:
                return .GET
            case .postClubChat:
                return .POST
            case .patchClubBookmark:
                return .PATCH
            }
        }
    }
}
