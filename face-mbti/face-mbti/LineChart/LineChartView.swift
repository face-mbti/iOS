//
//  LineChartView.swift
//  face-mbti
//
//  Created by 현기엽 on 2021/04/19.
//

import SwiftUI

struct LineChartView: View {
    let items: [LineChartItem]

    var body: some View {
        HStack(spacing: 0) {
            ForEach(items, id: \.name) { item in
                LineChartItemView(item: item)
            }
        }
        .frame(width: 60, height: 250, alignment: .center)
    }
}

struct LineChartView_Previews: PreviewProvider {
    static var previews: some View {
        LineChartView(items: [
            .init(name: "E", value: 0.1, color: Color(hexString: "7C85CF")),
            .init(name: "I", value: 1.0, color: Color(hexString: "84E8C4"))
        ])
    }
}
