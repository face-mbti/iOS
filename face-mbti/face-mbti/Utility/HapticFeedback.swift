//
//  HapticFeedback.swift
//  face-mbti
//
//  Created by 현기엽 on 2021/04/26.
//

import UIKit

class HapticFeedback {
    #if os(watchOS)
    //watchOS implementation
    static func playSelection() {
        WKInterfaceDevice.current().play(.click)
    }
    #elseif os(iOS)
    //iOS implementation
    let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
    static func playSelection() {
        UISelectionFeedbackGenerator().selectionChanged()
    }
    #else
    static func playSelection() {
        //No-op
    }
    #endif
}
