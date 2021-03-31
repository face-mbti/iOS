//
//  Encodable+jsonString.swift
//  face-mbti
//
//  Created by 현기엽 on 2021/03/29.
//

import Foundation

extension Encodable {
    var jsonString: String? {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .withoutEscapingSlashes]

        return try? String(data: encoder.encode(self), encoding: .utf8)
    }
}
