//
//  CharacterText.swift
//  face-mbti
//
//  Created by 현기엽 on 2021/04/23.
//

import SwiftUI

typealias CharacterTexts = [CharacterText]

extension CharacterTexts {
    static let dummmy: CharacterTexts = [
        .init(result: "개인주의자", bold: ["개인주의자"]),
        .init(result: "이상주의자의 면모가 강함", bold: ["이상주의자"]),
        .init(result: "이해심이 많고 적응력이 좋음", bold: ["이해심", "적응력"]),
        .init(result: "관대하고 개방적인편", bold: ["관대", "개방적"]),
        .init(result: "애정표시를 직접적으로 하지 못하는 편", bold: ["직접적으로"]),
        .init(result: "다수보단 소수의 특별한 사람들 선호", bold: ["다수", "소수"]),
        .init(result: "도덕적인 것과 비도덕적인 것에 민감하게 반응", bold: ["도덕적인 것", "비도덕적인 것"]),
        .init(result: "책과 언어에 관심이 많고 표현력이 좋음", bold: ["책과 언어", "표현력"]),
        .init(result: "사업과는 인연이 멀다", bold: ["사업"])
    ]
}

struct CharacterText: Codable {
    let result: String
    let bold: [String]

    var attributedText: Text {
        let fontSize: CGFloat = 20

        let ranges = self.bold
            .compactMap { self.result.range(of: $0) }
            .sorted { $0.lowerBound < $1.lowerBound }

        var startIndex = self.result.startIndex
        var array: [Text] = []
        for range in ranges {
            if startIndex < range.lowerBound {
                array.append(
                    Text(String(self.result[startIndex ..< range.lowerBound]))
                        .font(.helvetica(size: fontSize))
                )
            }
            array.append(
                Text(String(self.result[range]))
                    .font(.helvetica(size: fontSize))
                    .bold()
            )
            startIndex = range.upperBound
        }

        if startIndex != self.result.endIndex {
            array.append(
                Text(String(self.result[startIndex...]))
                    .font(.helvetica(size: fontSize))
            )
        }

        return array
            .reduce(Text(""), +)
    }
}
