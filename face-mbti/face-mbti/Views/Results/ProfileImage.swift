//
//  ProfileImage.swift
//  face-mbti
//
//  Created by 현기엽 on 2021/03/23.
//

import SwiftUI
import Rswift

struct ProfileImage: View {
    var image: ImageResource

    var body: some View {
        image.image
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .frame(width: 136, height: 136)
            .cornerRadius(136 / 2)
            .overlay(
                RoundedRectangle(cornerRadius: 136 / 2)
                    .stroke(
                        LinearGradient(
                            gradient: Gradient(colors: [R.color.orange.color, R.color.purple.color]),
                            startPoint: .top,
                            endPoint: .bottom
                        ),
                        lineWidth: 2
                    )

            )
    }
}
