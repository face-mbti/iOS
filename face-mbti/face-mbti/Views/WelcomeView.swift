//
//  WelcomeView.swift
//  face-mbti
//
//  Created by 현기엽 on 2021/05/02.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack(spacing: 12) {
            Text("FACE-MBTI")
                .font(.helvetica(size: 45))
                .bold()
                .padding(45)

            Spacer()

            Text("ABOUT: FACE-MBTI")
                .font(.helvetica(size: 30))

            Text("페이스 엠비티아이에 대한 간단할 설명같은게 이쪽에 들어가면 어떨까요 두줄에서 세줄정도면 될거같은데 당장은 무슨 말을 써야할진 ..")
                .font(.helvetica(size: 18))
                .padding()

            Spacer()
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
