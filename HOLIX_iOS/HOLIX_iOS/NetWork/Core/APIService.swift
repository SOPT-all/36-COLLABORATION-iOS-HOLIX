//
//  APIService.swift
//  HOLIX_iOS
//
//  Created by 정정욱 on 5/19/25.
//

import Foundation

final class APIService {
    static let shared = APIService()
    private init() {}

    private let baseURL: String = Bundle.main.infoDictionary?["BASE_URL"] as? String ?? ""

    func request<T: Decodable>(
        path: String,
        method: HTTPMethod,
        headers: [String : String]? = nil,
        body: Data? = nil,
        responseType: T.Type
    ) async throws -> T {
        guard let url = URL(string: baseURL + path) else {
            throw NetworkError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        if let headers {
            for (key, value) in headers {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }

        request.httpBody = body

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.responseError
        }

        guard (200...299).contains(httpResponse.statusCode) else {
            throw configureHTTPError(errorCode: httpResponse.statusCode)
        }

        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch let decodingError as DecodingError {
            print("❌ DecodingError: \(decodingError)")
            throw NetworkError.responseDecodingError
        } catch {
            print("❌ 일반 에러: \(error)")
            throw NetworkError.responseDecodingError
        }
    }

    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode)
        ?? NetworkError.unknownError
    }
}
