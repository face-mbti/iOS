//
//  Geometry++.swift
//  face-mbti
//
//  Created by 현기엽 on 2021/4/26.
//

import SwiftUI

// MARK: - matrix transformation
extension CGPoint {
    func rotate(angle: Angle) -> CGPoint {
        let x: CGFloat = self.x * CGFloat(cos(angle.radians)) - self.y * CGFloat(sin(angle.radians))
        let y: CGFloat = self.x * CGFloat(sin(angle.radians)) + self.y * CGFloat(cos(angle.radians))

        return CGPoint(x: x, y: y)
    }

    func move(delta: CGPoint) -> CGPoint {
        return CGPoint(x: self.x + delta.x, y: self.y + delta.y)
    }
}

extension CGRect {
    func isCirclePoint(_ point: CGPoint) -> Bool {
        let r = min(self.width, self.height) / 2
        let center = CGPoint(x: self.midX, y: self.midY)
        let dx = point.x - center.x
        let dy = point.y - center.y
        let distance = dx * dx + dy * dy
        return distance <= r * r
    }

    func angle(for point: CGPoint) -> Angle {
        let center = CGPoint(x: self.midX, y: self.midY)
        let dx = point.x - center.x
        let dy = point.y - center.y
        let acuteDegree = Double(atan(dy / dx)) * (180 / .pi)

        let isInBottomRight = dx >= 0 && dy >= 0
        let isInBottomLeft = dx <= 0 && dy >= 0
        let isInTopLeft = dx <= 0 && dy <= 0
        let isInTopRight = dx >= 0 && dy <= 0

        if isInBottomRight {
            return Angle(degrees: acuteDegree)
        } else if isInBottomLeft {
            return Angle(degrees: 180 - abs(acuteDegree))
        } else if isInTopLeft {
            return Angle(degrees: 180 + abs(acuteDegree))
        } else if isInTopRight {
            return Angle(degrees: 360 - abs(acuteDegree))
        }

        return Angle(degrees: 0)
    }

    var mid: CGPoint {
        return CGPoint(x: self.midX, y: self.midY)
    }
}
