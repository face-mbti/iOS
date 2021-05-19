//
//  PieChartView.swift
//  ChartView
//
//  Created by András Samu on 2019. 06. 12..
//  Copyright © 2019. András Samu. All rights reserved.
//

import SwiftUI

public struct PieChartView: View {
    public var data: [Double]
    public var dropShadow: Bool
    public var valueSpecifier: String
    public var accentColors: [Color]
    public var labels: [String]

    public init(
        data: [Double],
        accentColors: [Color],
        labels: [String],
        dropShadow: Bool? = true,
        valueSpecifier: String? = "%.1f"
    ) {
        self.data = data
        self.accentColors = accentColors
        self.labels = labels
        assert(data.count == accentColors.count && accentColors.count == labels.count)

        self.dropShadow = dropShadow!
        self.valueSpecifier = valueSpecifier!
    }

    public var body: some View {
        PieChartRow(data: data, accentColors: accentColors, labels: labels)
    }
}

#if DEBUG
struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartView(data: [70, 25, 5], accentColors: [.red, .blue, .green], labels: ["ISFP\n70%", "ISFP\n25%", "ISFP\n5%"])
    }
}
#endif
