//
//  LineChartItemView.swift
//  face-mbti
//
//  Created by 현기엽 on 2021/04/19.
//

import SwiftUI

struct LineChartItemView: View {
    let index: Int
    let item: LineChartItem
    @State var isShow = false

    var body: some View {
        VStack(spacing: 7) {
            GeometryReader { geometry in
                VStack(spacing: 0) {
                    Spacer(minLength: 0)
                    Rectangle()
                        .foregroundColor(item.color)
                        .height(isShow ? geometry.size.height * item.value : 0)
                        .animation(Animation.spring().delay(0.04 * Double(self.index)))
                        .onAppear {
                            self.isShow = true
                        }
                }
            }

            Rectangle()
                .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.24))
                .height(0.5)

            Text(item.name)
                .foregroundColor(Color.init(hexString: "3E3E3E"))
                .font(.helvetica(size: 24))
                .bold()
        }
    }
}

struct LineChartItemView_Previews: PreviewProvider {
    static var previews: some View {
        LineChartItemView(
            index: 0,
            item: .init(
                name: "I",
                value: 1.0,
                color: Color(hexString: "84E8C4")
            )
        )
        .previewLayout(.sizeThatFits)
            .frame(width: 30, height: 200, alignment: .center)
    }
}
