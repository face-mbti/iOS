//
//  ResultView.swift
//  face-mbti
//
//  Created by 현기엽 on 2021/03/28.
//

import SwiftUI
import SwiftUIX

struct ResultTabView: View {
    @State var isSheet = false

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ResultProfileView()
                    .padding()

                LazyVStack(spacing: 12) {
                    ResultLineChartView()
                        .padding()
                    ResultPieChartView()
                        .padding()
                }
                .padding()
                .background(.gray960)

                ResultCelebrityView()

                Button(action: { isSheet = true }, label: { Text("공유하기") })
                    .sheet(isPresented: $isSheet) {
                        AppActivityView(activityItems: ["Hello!"])
                    }
            }
        }
    }
}

struct ResultProfileView: View {
    var body: some View {
        VStack(spacing: 20) {
            R.image.sampleProfile.image
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .padding()

            VStack {
                Text("감성이 풍부해 보이는 당신은")
                    .font(.helvetica(size: 18))

                HStack {
                    Text("INFP")
                        .font(.helvetica(size: 48)).bold()
                    Text("75%")
                        .font(.helvetica(size: 24))
                }
            }

            VStack(alignment: .leading, spacing: 8) {
                ForEach(CharacterTexts.dummmy, id: \.result) { text in
                    text.attributedText
                }
            }
        }
    }
}

struct ResultPieChartView: View {
    var body: some View {
        PieChartView(
            data: [70, 13, 17],
            accentColors: [.chartBlue, .chartGreen, .gray765],
            labels: ["INFP\n75%", "ENFP\n13%", "ISTJ\n17%"]
        )
        .frame(width: 300, height: 300)
    }
}

struct ResultLineChartView: View {
    var body: some View {
        HStack {
            Spacer()
            LineChartView(index: 0, items: [
                .init(name: "E", value: 0.34, color: .chartBlue),
                .init(name: "I", value: 0.66, color: .chartGreen)
            ])

            Spacer()
            LineChartView(index: 1, items: [
                .init(name: "N", value: 0.8, color: .chartBlue),
                .init(name: "S", value: 0.2, color: .chartGreen)
            ])

            Spacer()
            LineChartView(index: 2, items: [
                .init(name: "T", value: 0.3, color: .chartBlue),
                .init(name: "F", value: 0.7, color: .chartGreen)
            ])

            Spacer()
            LineChartView(index: 3, items: [
                .init(name: "P", value: 0.6, color: .chartBlue),
                .init(name: "J", value: 0.4, color: .chartGreen)
            ])
            Spacer()
        }
    }
}

struct ResultCelebrityView: View {
    var body: some View {
        VStack {
            Text("나와 같은 MBTI를 가진 사람은 누가 있을까요?")
                .font(.helvetica(size: 18)).bold()
                .foregroundColor(.darkGreen)

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(Celebrity.dummy, id: \.name) { celebrity in
                        CelebrityCellView(celebrity: celebrity)
                            .padding([.leading, .trailing])
                    }
                }
            }
        }
        .padding()
        .background(.lightJade)
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultTabView()
    }
}
