//
//  LoadingView.swift
//  face-mbti
//
//  Created by 현기엽 on 2021/03/28.
//

import SwiftUI
import Combine

struct LoadingView: View {
    let timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    @State var showResultTabView = false
    @State var typeIndex = 0
    @State var cancellabels = Set<AnyCancellable>()
    @Binding var imageData: Data?

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                CircledCharacter(type: Type.allCases[typeIndex])
                    .onReceive(timer) { _ in
                        typeIndex = (typeIndex + 1) % Type.allCases.count
                    }

                Text("당신의 MBTI를 찾고 있어요")
                    .font(R.font.aGaramondProRegular.font(size: 20))
                    .padding()

                NavigationLink("",
                               destination: ResultTabView()
                                .navigationBarTitle("")
                                .navigationBarHidden(true),
                               isActive: $showResultTabView
                )
            }.onAppear {
                    HTTPClient.shared.uploadImage(type: UploadResult.self, imageData!)
                        .sink(
                            receiveCompletion: { _ in },
                            receiveValue: { result in
                                print(result)
                                showResultTabView = true
                            }
                        )
                        .store(in: &cancellabels)
            }
        }.navigationBarHidden(true)
    }
}

enum Type: String, CaseIterable {
    case P, F, S, I, N, T, J, E

    var color: Color {
        switch self {
        case .I, .E:
            return R.color.pink.color
        case .N, .S:
            return R.color.green.color
        case .T, .F:
            return R.color.yellow.color
        case .J, .P:
            return R.color.blue.color
        }
    }
}

private struct CircledCharacter: View {
    let type: Type

    var body: some View {
        GeometryReader { geometry in
            Text(type.rawValue)
                .font(R.font.allertaStencilRegular.font(size: 144))
                .foregroundColor(.white)
                .position(x: geometry.size.width * 0.75, y: geometry.size.height * 0.5)
        }
        .background(type.color)
        .frame(CGSize(width: 145, height: 145))
        .clipShape(Circle())
        .shadow(color: .gray550, radius: 10, x: 0, y: 5)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LazyVGrid(columns: [GridItem(), GridItem()], spacing: 25) {
            ForEach(Type.allCases, id: \.self) { type in
                CircledCharacter(type: type)
                    .previewLayout(.sizeThatFits)
            }
        }
        .padding()
        .previewLayout(.sizeThatFits)

        LoadingView(imageData: Binding.constant(nil))
    }
}
