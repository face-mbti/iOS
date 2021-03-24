//
//  UploadViewController.swift
//  face-mbti
//
//  Created by 현기엽 on 2021/03/21.
//

import UIKit

class UploadViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.present(R.storyboard.loading)
        }
    }
}
