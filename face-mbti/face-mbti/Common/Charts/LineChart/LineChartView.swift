//
//  LineChartView.swift
//  face-mbti
//
//  Created by 현기엽 on 2021/04/19.
//

import SwiftUI

struct LineChartView: View {
    let index: Int
    let items: [LineChartItem]

    var body: some View {
        HStack(spacing: 0) {
            ForEach(items.enumeratedArray(), id: \.element.name) { index, item in
                LineChartItemView(index: self.index * items.count + index, item: item)
            }
        }
        .frame(width: 60, height: 250, alignment: .center)
    }
}

struct LineChartView_Previews: PreviewProvider {
    static var previews: some View {
        LineChartView(index: 0, items: [
            .init(name: "E", value: 0.1, color: .chartGreen),
            .init(name: "I", value: 1.0, color: .chartBlue)
        ])
    }
}
