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
                    R.color.blue.color
                    R.color.green.color
                }.ignoresSafeArea()

                VStack(spacing: 8) {
                    Text("당신의 MBTI는?")
                        .foregroundColor(.white)
                        .font(.custom("Helvetica", size: 48)).bold()

                    Text("사진을 업로드해주세요")
                        .foregroundColor(.white)
                        .font(.custom("Helvetica", size: 22)).bold()

                    ZStack {
                        Circle()
                            .frame(width: 219, height: 219)
                            .shadow(color: Color(.sRGB, red: 0.55, green: 0.54, blue: 0.68, opacity: 1), radius: 10, x: 0, y: 5)
                            .foregroundColor(Color(.init(white: 1, alpha: 0.4)))

                        R.image.camera.image
                            .resizable()
                            .frame(width: 120, height: 90)
                    }
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
