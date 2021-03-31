//
//  UploadView.swift
//  face-mbti
//
//  Created by 현기엽 on 2021/03/28.
//

import SwiftUI

struct UploadView: View {
    @State var showLoadingView = false

    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    R.color.primary.color
                    R.color.seconary.color
                }.ignoresSafeArea()
                VStack {
                    Image(systemName: "photo")
                        .resizable()
                        .frame(width: 136, height: 136)
                        .overlay(
                            Rectangle()
                                .strokeBorder(
                                    style: StrokeStyle(
                                        lineWidth: 2,
                                        dash: [15]
                                    )
                                )
                        )
                    Text("사진을 선택해주세요")
                }
                NavigationLink("", destination: LoadingView(), isActive: $showLoadingView)
            }.onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    showLoadingView = true
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        UploadView()
    }
}
