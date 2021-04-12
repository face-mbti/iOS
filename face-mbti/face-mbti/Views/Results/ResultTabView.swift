//
//  ResultView.swift
//  face-mbti
//
//  Created by 현기엽 on 2021/03/28.
//

import SwiftUI
import SwiftUIX
import AlamofireImage

struct ResultTabView: View {
    @State var isSheet = false

    let sampleTexts = [
        "개인주의자",
        "이상주의자의 면모가 강함",
        "이해심이 많고 적응력이 좋음",
        "관대하고 개방적인편",
        "애정표시를 직접적으로 하지 못하는 편",
        "다수보단 소수의 특별한 사람들 선호",
        "도덕적인 것과 비도덕적인 것에 민감하게 반응",
        "책과 언어에 관심이 많고 표현력이 좋음",
        "사업과는 인연이 멀다"
    ]

    var body: some View {
        NavigationView {
            TabView {
                ScrollView {
                    VStack {
                        R.image.sampleProfile.image
                            .resizable()
                            .frame(width: 120, height: 120)
                        Text("감성이 풍부해 보이는 당신은")
                            .font(.helvetica(size: 18))
                        Text("INFP")
                            .font(.helvetica(size: 48)).bold()
                        Text("75%")
                            .font(.helvetica(size: 24))

                        VStack(alignment: .leading) {
                            ForEach(sampleTexts, id: \.self) { text in
                                Text("- \(text)")
                            }
                        }

                        PieChartView(
                            data: [70, 13, 17],
                            accentColors: [.red, .blue, .green],
                            labels: ["INFP", "ENFP", "ISTJ"]
                        )
                        .frame(width: 300, height: 300)

                        VStack {
                            Text("나와 같은 MBTI를 가진 사람은 누가 있을까요?")
                                .font(.helvetica(size: 18)).bold()
                                .foregroundColor(Color(hexadecimal: "3D6560"))

                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(Celebrity.dummy, id: \.name) { celebrity in
                                        CelebrityCellView(celebrity: celebrity)
                                            .padding([.leading, .trailing])
                                    }
                                }
                            }
                        }
                        .padding()
                        .background(Color(hexString: "CCE5E2"))

                        Button(action: { isSheet = true }, label: { Text("공유하기") })
                            .sheet(isPresented: $isSheet) {
                                AppActivityView(activityItems: ["Hello!"])
                            }
                    }
                }

                ResultPredictView(predictionResult: .dummy)
                    .tabItem {
                        Text("Second")
                    }

                ResultCelebrityView()
                    .tabItem {
                        Text("Third")
                    }
            }
        }.navigationBarHidden(true)
    }
}

struct ResultPredictView: View {
    let predictionResult: PredictionResult

    var body: some View {
        Text(predictionResult.jsonString ?? "invalid json!")
    }
}

struct ResultCelebrityView: View {
    var body: some View {
        Text("Celebrity")
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultTabView()
    }
}
