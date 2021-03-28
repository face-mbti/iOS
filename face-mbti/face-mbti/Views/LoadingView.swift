//
//  LoadingView.swift
//  face-mbti
//
//  Created by 현기엽 on 2021/03/28.
//

import SwiftUI

struct LoadingView: View {
    @State var showResultTabView = false

    var body: some View {
        NavigationView {
            VStack {
                ProgressView()
                Text("당신의 MBTI를 찾고 있어요")
                            NavigationLink("", destination: ResultTabView(), isActive: $showResultTabView)
            }.onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    showResultTabView = true
                }
            }
        }.navigationBarHidden(true)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
