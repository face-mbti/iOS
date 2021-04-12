//
//  PieChartCell.swift
//  ChartView
//
//  Created by András Samu on 2019. 06. 12..
//  Copyright © 2019. András Samu. All rights reserved.
//

import SwiftUI

struct PieSlice: Identifiable {
    var id = UUID()
    var startDeg: Double
    var endDeg: Double
    var value: Double
    var normalizedValue: Double
}

public struct PieChartCell: View {
    @State private var show: Bool = false
    var rect: CGRect
    var radius: CGFloat {
        return min(rect.width, rect.height)/2
    }
    var startDeg: Double
    var endDeg: Double
    var path: Path {
        var path = Path()
        path.addArc(center: rect.mid, radius: self.radius, startAngle: Angle(degrees: self.startDeg), endAngle: Angle(degrees: self.endDeg), clockwise: false)
        path.addLine(to: rect.mid)
        path.closeSubpath()
        return path
    }
    var index: Int
    var accentColor: Color
    var label: String

    public var body: some View {
        ZStack {
            path
                .fill()
                .foregroundColor(self.accentColor)
                .overlay(path.stroke(Color.white, lineWidth: 3))
                .scaleEffect(self.show ? 1 : 0)
                .animation(Animation.spring().delay(Double(self.index) * 0.04))
                .onAppear {
                    self.show = true
                }

            Text(label)
                .font(.helvetica(size: 24)).bold()
                .foregroundColor(.white)
                .position(textPoint(center: rect.mid, radius: radius, startAngle: Angle(degrees: self.startDeg), endAngle: Angle(degrees: self.endDeg)))
        }
    }

    private func textPoint(center: CGPoint, radius: CGFloat, startAngle: Angle, endAngle: Angle) -> CGPoint {
        let x = (radius / 2) * CGFloat(cos((endAngle.radians - startAngle.radians) / 2))
        let y = (radius / 2) * CGFloat(sin((endAngle.radians - startAngle.radians) / 2))
        let point = CGPoint(x: x, y: y)
        return move(point: rotate(point: point, angle: startAngle), delta: center)
    }

    private func rotate(point: CGPoint, angle: Angle) -> CGPoint {
        let x: CGFloat = point.x * CGFloat(cos(angle.radians)) - point.y * CGFloat(sin(angle.radians))
        let y: CGFloat = point.x * CGFloat(sin(angle.radians)) + point.y * CGFloat(cos(angle.radians))

        return CGPoint(x: x, y: y)
    }

    private func move(point: CGPoint, delta: CGPoint) -> CGPoint {
        return CGPoint(x: point.x + delta.x, y: point.y + delta.y)
    }
}

extension CGRect {
    var mid: CGPoint {
        return CGPoint(x: self.midX, y: self.midY)
    }
}

#if DEBUG
struct PieChartCell_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            PieChartCell(rect: geometry.frame(in: .local), startDeg: 45.0, endDeg: 160.0, index: 0, accentColor: Color(red: 225.0/255.0, green: 97.0/255.0, blue: 76.0/255.0), label: "INFP\n75%")
            }.frame(width: 300, height: 300)

    }
}
#endif
