//
//  PieChartRow.swift
//  ChartView
//
//  Created by András Samu on 2019. 06. 12..
//  Copyright © 2019. András Samu. All rights reserved.
//

import SwiftUI

public struct PieChartRow: View {
    let data: [Double]
    let accentColors: [Color]
    let labels: [String]
    @State var slices: PieSlices = PieSlices(data: [])

    public var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(slices.values.enumeratedArray(), id: \.element.startAngle) { index, slice in
                    PieChartCell(
                        rect: geometry.frame(in: .local),
                        startAngle: slice.startAngle,
                        endAngle: slice.endAngle,
                        index: index,
                        accentColor: self.accentColors[index],
                        label: self.labels[index]
                    )
                }
            }
        }
        .onAppear {
            slices = PieSlices(data: data)
        }
    }
}

#if DEBUG
struct PieChartRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PieChartRow(data: [8, 23, 54, 32, 12, 37, 7, 23, 43], accentColors: [.red, .blue, .pink, .brown, .indigo, .yellow, .teal, .secondary, .green], labels: ["a", "a", "a", "a", "a", "a", "a", "a", "a"])
                .frame(width: 100, height: 100)
            PieChartRow(data: [0], accentColors: [Color(red: 225.0/255.0, green: 97.0/255.0, blue: 76.0/255.0)], labels: ["a"])
                .frame(width: 100, height: 100)
        }
    }
}
#endif
