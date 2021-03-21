//
//  LoadingViewController.swift
//  face-mbti
//
//  Created by 현기엽 on 2021/03/21.
//

import UIKit

class LoadingViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let loading = UIStoryboard(name: "Result", bundle: .main).instantiateInitialViewController()
            loading?.modalPresentationStyle = .fullScreen
            self.present(loading!, animated: true, completion: nil)
        }
    }
}
