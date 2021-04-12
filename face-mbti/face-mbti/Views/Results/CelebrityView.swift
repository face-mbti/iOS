//
//  CelebrityView.swift
//  face-mbti
//
//  Created by 현기엽 on 2021/04/11.
//

import SwiftUI

struct CelebrityCellView: View {
    let celebrity: Celebrity
    let textColor = Color(hexString: "3D6560")

    var body: some View {
        VStack {
            RemoteImage(url: celebrity.imageURL)
                .frame(width: 150, height: 150)
            Text(celebrity.occupation)
                .foregroundColor(textColor)
                .font(.helvetica(size: 18)).bold()
            Text(celebrity.name)
                .foregroundColor(textColor)
                .font(.helvetica(size: 18))
        }
    }
}

struct CelebrityCellView_Previews: PreviewProvider {
    static var previews: some View {
        CelebrityCellView(celebrity: Celebrity.dummy.first!)
    }
}
