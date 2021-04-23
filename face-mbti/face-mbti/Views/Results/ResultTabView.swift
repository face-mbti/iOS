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
            LazyVStack(spacing: 20) {
                ResultProfileView()

                VStack(spacing: 12) {
                    ResultLineChartView()
                    ResultPieChartView()
                }
                .padding()
                .foregroundColor(Color(hexString: "F6F6F6"))

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

struct ResultPieChartView: View {
    var body: some View {
        PieChartView(
            data: [70, 13, 17],
            accentColors: [Color(hexString: "#7C85CF"), Color(hexString: "#84E8C4"), Color(hexString: "#C4C4C4")],
            labels: ["INFP\n75%", "ENFP\n13%", "ISTJ\n17%"]
        )
        .frame(width: 300, height: 300)
    }
}

struct ResultLineChartView: View {
    var body: some View {
        HStack {
            Spacer()
            LineChartView(items: [
                .init(name: "E", value: 0.34, color: Color(hexString: "7C85CF")),
                .init(name: "I", value: 0.66, color: Color(hexString: "84E8C4"))
            ])

            Spacer()
            LineChartView(items: [
                .init(name: "N", value: 0.8, color: Color(hexString: "7C85CF")),
                .init(name: "S", value: 0.2, color: Color(hexString: "84E8C4"))
            ])

            Spacer()
            LineChartView(items: [
                .init(name: "T", value: 0.3, color: Color(hexString: "7C85CF")),
                .init(name: "F", value: 0.7, color: Color(hexString: "84E8C4"))
            ])

            Spacer()
            LineChartView(items: [
                .init(name: "P", value: 0.6, color: Color(hexString: "7C85CF")),
                .init(name: "J", value: 0.4, color: Color(hexString: "84E8C4"))
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
                .foregroundColor(Color(hexadecimal: "3D6560"))

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
        .background(Color(hexString: "CCE5E2"))
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultTabView()
    }
}
