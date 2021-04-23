//
//  Celebrity.swift
//  face-mbti
//
//  Created by 현기엽 on 2021/04/11.
//

import Foundation

struct Celebrity: Codable {
    let occupation: String
    let name: String
    let imageURL: URL

    static let dummy: [Celebrity] = [
        .init(occupation: "트와이스", name: "채영", imageURL: URL(string: "https://user-images.githubusercontent.com/16751025/115870505-4bd2be80-a47a-11eb-91db-22e0453344a0.png")!),
        .init(occupation: "배우", name: "서강준", imageURL: URL(string: "https://user-images.githubusercontent.com/16751025/115870515-4f664580-a47a-11eb-919f-11b3a9560d53.png")!),
        .init(occupation: "BTS", name: "정국", imageURL: URL(string: "https://user-images.githubusercontent.com/16751025/115870518-4ffedc00-a47a-11eb-8384-38a787b7d84f.png")!),
        .init(occupation: "배우", name: "민효린", imageURL: URL(string: "https://user-images.githubusercontent.com/16751025/115870520-50977280-a47a-11eb-91e1-51a17614434e.png")!)
    ]
}
