//
//  UploadView.swift
//  face-mbti
//
//  Created by 현기엽 on 2021/03/28.
//

import SwiftUI
import SwiftUIX
import Combine

struct UploadView: View {
    @State var showImagePicker = false
//    @ObservedObject var datasource = Datasource.shared
    @State var cancellabels = Set<AnyCancellable>()
    @State var imageData: Data?

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.lightGreen, .lightBlue]), startPoint: .top, endPoint: .bottom)
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
                            .shadow(color: .uploadGray, radius: 10, x: 0, y: 5)
                            .foregroundColor(.white.opacity(0.4))

                        R.image.camera.image
                            .resizable()
                            .frame(width: 120, height: 90)
                    }
                    .onTapGesture {
                        showImagePicker = true
                    }

                    Button(action: {
                        showImagePicker = true
                    }) {
                        Text("UPLOAD")
                            .font(.helvetica(size: 22)).bold()
                            .foregroundColor(.white)
                            .frame(width: 233, height: 61, alignment: .center)
                    }
                    .background(.darkBlue)
                    .cornerRadius(30.5)
                    .sheet(isPresented: $showImagePicker) {
                        ImagePicker(data: $imageData, encoding: .png)
                    }
                }

                NavigationLink(
                    "",
                    destination: LoadingView(imageData: $imageData),
                    isActive: Binding(get: { imageData != nil }, set: { _ in })
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        UploadView(imageData: Data())
    }
}
