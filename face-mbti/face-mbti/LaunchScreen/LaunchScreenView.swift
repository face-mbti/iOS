//
//  LaunchScreenView.swift
//  face-mbti
//
//  Created by 현기엽 on 2021/05/02.
//

import SwiftUI

struct LaunchScreenView: View {
    @State var isWelcomePresented: Bool = true

    var body: some View {
        UploadView()
            .sheet(isPresented: $isWelcomePresented) {
                WelcomeView()
            }
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}
