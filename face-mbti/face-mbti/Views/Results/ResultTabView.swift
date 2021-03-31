//
//  ResultView.swift
//  face-mbti
//
//  Created by 현기엽 on 2021/03/28.
//

import SwiftUI

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
    var body: some View {
        ProfileImage(image: R.image.sampleProfile)
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
