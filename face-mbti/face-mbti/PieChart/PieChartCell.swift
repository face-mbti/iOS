//
//  PieChartCell.swift
//  ChartView
//
//  Created by András Samu on 2019. 06. 12..
//  Copyright © 2019. András Samu. All rights reserved.
//

import SwiftUI

public struct PieChartCell: View {
    @State private var isShow: Bool = false
    var rect: CGRect
    var radius: CGFloat {
        return min(rect.width, rect.height) / 2
    }
    var startAngle: Angle
    var endAngle: Angle
    var path: Path {
        var path = Path()
        path.addArc(center: rect.mid, radius: self.radius, startAngle: self.startAngle, endAngle: self.endAngle, clockwise: false)
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
                .overlay(path.stroke(Color.gray960, lineWidth: 3))
                .scaleEffect(self.isShow ? 1 : 0)
                .animation(Animation.spring().delay(Double(self.index) * 0.04))
                .onAppear {
                    self.isShow = true
                }

            Text(label)
                .font(.helvetica(size: 18)).bold()
                .foregroundColor(.white)
                .position(textPoint(center: rect.mid, radius: radius, startAngle: self.startAngle, endAngle: self.endAngle))
        }
    }

    private func textPoint(center: CGPoint, radius: CGFloat, startAngle: Angle, endAngle: Angle) -> CGPoint {
        let x = (radius / 2) * CGFloat(cos((endAngle.radians - startAngle.radians) / 2))
        let y = (radius / 2) * CGFloat(sin((endAngle.radians - startAngle.radians) / 2))

        return CGPoint(x: x, y: y)
            .rotate(angle: startAngle)
            .move(delta: center)
    }
}

#if DEBUG
struct PieChartCell_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            PieChartCell(rect: geometry.frame(in: .local), startAngle: Angle(degrees: 45.0), endAngle: Angle(degrees: 160.0), index: 0, accentColor: .chartBlue, label: "INFP\n75%")
            }.frame(width: 300, height: 300)

        GeometryReader { geometry in
            PieChartCell(rect: geometry.frame(in: .local), startAngle: Angle(degrees: 45.0), endAngle: Angle(degrees: 90.0), index: 0, accentColor: .chartGreen, label: "INFP 75%")
            }.frame(width: 300, height: 300)
    }
}
#endif
