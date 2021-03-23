//
//  UIColor+hexString.swift
//  face-mbti
//
//  Created by 현기엽 on 2021/03/23.
//

import UIKit

extension UIColor {
    convenience init(hexString: String) {
        var value: UInt64 = 0
        let scanner = Scanner(string: hexString)
        scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")
        scanner.scanHexInt64(&value)
        
        self.init(
            red: CGFloat((value & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((value & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(value & 0x0000FF) / 255.0,
            alpha: 1
        )
    }
}
