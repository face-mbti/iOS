//
//  PieSlices.swift
//  face-mbti
//
//  Created by 현기엽 on 2021/04/26.
//

import Foundation
import SwiftUI

struct PieSlices {
    let values: [PieSlice]

    init(data: [Double]) {
        let sum = data.reduce(0, +)
        let data = data.map { $0 / sum * 360 }
        let cumulative = data.reduce([]) { result, value in
            return result + [(result.last ?? 0) + value]
        }

        values = zip(data, cumulative)
            .map { value, cumulative in
                PieSlice(startAngle: Angle(degrees: (cumulative - value)), endAngle: Angle(degrees: cumulative))
            }
    }

    func pieSlice(at angle: Angle) -> PieSlice? {
        return values.first { $0.startAngle ..< $0.endAngle ~= angle }
    }
}

struct PieSlice: Equatable {
    let startAngle: Angle
    let endAngle: Angle
}
