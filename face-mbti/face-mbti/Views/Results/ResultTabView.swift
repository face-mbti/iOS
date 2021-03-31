//
//  ResultView.swift
//  face-mbti
//
//  Created by 현기엽 on 2021/03/28.
//

import SwiftUI
import SwiftUIX

struct ResultTabView: View {
    var body: some View {
        NavigationView {
            TabView {
                ResultView()
                    .tabItem {
                        Text("First")
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

struct ResultView: View {
    @State var isSheet = false

    var body: some View {
        VStack {
            ProfileImage(image: R.image.sampleProfile)
            Button(action: { isSheet = true }, label: { Text("공유하기") })
                .sheet(isPresented: $isSheet) {
                    AppActivityView(activityItems: ["Hello!"])
                }
        }
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
