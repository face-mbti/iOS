//
//  Collection+Enumerated.swift
//  face-mbti
//
//  Created by 현기엽 on 2021/04/28.
//

import SwiftUI

extension Collection {
    func enumeratedArray() -> [(offset: Int, element: Self.Element)] {
        return Array(self.enumerated())
    }
}
