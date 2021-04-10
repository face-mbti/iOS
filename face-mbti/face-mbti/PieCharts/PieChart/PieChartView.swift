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
    public var style: ChartStyle
    public var formSize: CGSize
    public var dropShadow: Bool
    public var valueSpecifier: String

    @State private var showValue = false
    @State private var currentValue: Double = 0 {
        didSet {
            if oldValue != self.currentValue && self.showValue {
                HapticFeedback.playSelection()
            }
        }
    }

    public init(data: [Double], style: ChartStyle = Styles.pieChartStyleOne, form: CGSize? = ChartForm.medium, dropShadow: Bool? = true, valueSpecifier: String? = "%.1f") {
        self.data = data
        self.style = style
        self.formSize = form!
        if self.formSize == ChartForm.large {
            self.formSize = ChartForm.extraLarge
        }
        self.dropShadow = dropShadow!
        self.valueSpecifier = valueSpecifier!
    }

    public var body: some View {
        PieChartRow(data: data, accentColor: self.style.accentColor, showValue: $showValue, currentValue: $currentValue)
            .rotationEffect(.degrees(45))
    }
}

#if DEBUG
struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartView(data: [70, 17, 13])
    }
}
#endif
