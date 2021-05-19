//
//  SwiftUI+Rswift.swift
//  face-mbti
//
//  Created by 현기엽 on 2021/03/28.
//

import Rswift
import SwiftUI

// https://github.com/mac-cain13/R.swift/issues/600
extension FontResource {
    func font(size: CGFloat) -> Font {
        Font.custom(fontName, size: size)
    }
}

extension ColorResource {
    var color: Color {
        Color(name)
    }
}

extension StringResource {
    var localizedStringKey: LocalizedStringKey {
        LocalizedStringKey(key)
    }

    var text: Text {
        Text(localizedStringKey)
    }
}

extension ImageResource {
    var image: Image {
        Image(name)
    }
}
