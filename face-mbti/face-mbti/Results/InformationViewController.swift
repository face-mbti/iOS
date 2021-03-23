//
//  InformationViewController.swift
//  face-mbti
//
//  Created by 현기엽 on 2021/03/21.
//

import UIKit
import SnapKit
import AlamofireImage

class InformationViewController: UIViewController {
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 16
        self.view.addSubview(stackView) { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide).priority(.low)
        }
        return stackView
    }()
    
    private let imageSize = 284
    private let dummyImageURL = URL(string: "http://img.wkorea.com/w/2021/03/style_6055af0bbb173.jpg")!
    private lazy var circleView: GradientBorderCircleImageView = {
        let circleView = GradientBorderCircleImageView(frame: CGRect(x: 0, y: 0, width: imageSize, height: imageSize))
        circleView.af.setImage(withURL: dummyImageURL)
        circleView.contentMode = .scaleAspectFit
        return circleView
    }()
    
    private lazy var percentageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.text = "당신의 mbti는...\nintp 87%"
        return label
    }()
    
    private lazy var informationLabel: UILabel = {
        let label = UILabel()
        label.text = "information"
        label.font = .boldSystemFont(ofSize: 30)
        label.textColor = R.color.primary()
        return label
    }()
    
    private lazy var informationBodyLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = """
            * iu = infp

            동해물과백두산이마르고닳도록하느님이보우하사우리나라만세무궁화삼천리화려강산대한사람대한으로길이보전하세동해물과백두산이마르고닳도록하느님이보우하사우리나라만세무궁화삼천리화려강산대한사람대한으로길이보전하세동해물과백두산이
            """
        return label
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton()
        button.setTitle("공유하자", for: .normal)
        button.backgroundColor = R.color.seconary()
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stackView.addArrangedSubview(circleView) { make in
            make.width.height.equalTo(imageSize)
        }
        stackView.addArrangedSubview(percentageLabel)
        stackView.addArrangedSubview(informationLabel)
        stackView.addArrangedSubview(informationBodyLabel)
        stackView.addArrangedSubview(shareButton) { make in
            make.width.equalToSuperview()
            make.height.equalTo(72)
        }
    }
}
