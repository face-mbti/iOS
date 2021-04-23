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
                LinearGradient(gradient: Gradient(colors: [
                                                    Color(.displayP3, red: 152 / 256, green: 248 / 256, blue: 208 / 256, opacity: 1), Color(.displayP3, red: 104 / 256, green: 173 / 256, blue: 241 / 256, opacity: 1)]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()

                VStack(spacing: 32) {
                    VStack(spacing: 8) {
                        Text("당신의 MBTI는?")
                            .foregroundColor(.white)
                            .font(.helvetica(size: 48)).bold()

                        Text("사진을 업로드해주세요")
                            .foregroundColor(.white)
                            .font(.helvetica(size: 22)).bold()
                    }
                    ZStack {
                        Circle()
                            .frame(width: 219, height: 219)
                            .shadow(color: Color(.sRGB, red: 0.55, green: 0.54, blue: 0.68, opacity: 1), radius: 10, x: 0, y: 5)
                            .foregroundColor(Color(.init(white: 1, alpha: 0.4)))

                        R.image.camera.image
                            .resizable()
                            .frame(width: 120, height: 90)
                    }
                    Text("UPLOAD")
                        .font(.helvetica(size: 22)).bold()
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 233, height: 61, alignment: .center)
                        .background(Color(hexString: "4181B0"))
                        .cornerRadius(30.5)
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
