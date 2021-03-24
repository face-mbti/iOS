//
//  GradientBorderCircleView.swift
//  face-mbti
//
//  Created by 현기엽 on 2021/03/23.
//

import UIKit
import SnapKit

class GradientBorderCircleImageView: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonSetup()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.commonSetup()
    }
    
    init() {
        super.init(frame: .zero)
        self.commonSetup()
    }
    
    func commonSetup() {
        clipsToBounds = true
        layer.cornerRadius = bounds.width / 2
        backgroundColor = .systemBackground
        layer.addGradienBorder(colors: [UIColor(hexString: "#FFB441"), UIColor(hexString: "#CD1083")], width: bounds.width * 0.03)
        snp.makeConstraints { make in
            make.width.equalTo(snp.height)
        }
    }
}

fileprivate extension CALayer {
    func addGradienBorder(colors: [UIColor], width: CGFloat = 1) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame =  CGRect(origin: .zero, size: self.bounds.size)
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.colors = colors.map { $0.cgColor }
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.lineWidth = width
        shapeLayer.path = UIBezierPath(
            roundedRect: self.bounds.insetBy(dx: width / 2, dy: width / 2),
            cornerRadius: self.bounds.width / 2
        ).cgPath
        shapeLayer.fillColor = nil
        shapeLayer.strokeColor = UIColor.black.cgColor
        gradientLayer.mask = shapeLayer
        
        self.addSublayer(gradientLayer)
    }
}
