//
//  HTTPClient.swift
//  face-mbti
//
//  Created by 현기엽 on 2021/05/12.
//

import Foundation
import Alamofire
import Combine

struct HTTPClient {
    static let shared = HTTPClient()

    private init() {}

    private let domain = "http://27.96.134.86:4000"

    func uploadImage<T: Decodable>(type: T.Type, _ data: Data) -> AnyPublisher<T, Error> {
        AF.upload(
            multipartFormData: { multipartFormData in
                multipartFormData.append(
                    data,
                    withName: "filename",
                    fileName: UUID().uuidString,
                    mimeType: "image/jpg"
                )
            },
            to: "\(domain)/predict"
        )
        .publishDecodable(type: T.self)
        .tryMap { response -> T in
            switch response.result {
            case .success(let data):
                return data
            case .failure(let error):
                throw error
            }
        }
        .eraseToAnyPublisher()
    }
}
