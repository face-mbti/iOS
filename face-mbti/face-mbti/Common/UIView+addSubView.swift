//
//  UIView+addSubView.swift
//  face-mbti
//
//  Created by 현기엽 on 2021/03/24.
//

import UIKit
import SnapKit

extension UIView {
    func addSubview(_ view: UIView, _ makeConstraints: (ConstraintMaker) -> Void) {
        self.addSubview(view)
        view.snp.makeConstraints(makeConstraints)
    }
}

extension UIStackView {
    func addArrangedSubview(_ view: UIView, _ makeConstraints: (ConstraintMaker) -> Void) {
        self.addArrangedSubview(view)
        view.snp.makeConstraints(makeConstraints)
    }
}
