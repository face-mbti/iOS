//
//  CelebrityCollectionViewCell.swift
//  face-mbti
//
//  Created by 현기엽 on 2021/03/25.
//

import UIKit

class CelebrityCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: GradientBorderCircleImageView!
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var name: UILabel!
    
    func config(image: UIImage, name: String, id: String) {
        self.imageView.image = image
        self.name.text = name
        self.id.text = id
    }
}
