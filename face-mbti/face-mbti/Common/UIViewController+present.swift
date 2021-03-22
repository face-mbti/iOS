//
//  UIViewController+present.swift
//  face-mbti
//
//  Created by 현기엽 on 2021/03/22.
//

import UIKit

extension UIViewController {
    func present(_ storyboard: UIStoryboard,
                 modalPresentationStyle: UIModalPresentationStyle = .fullScreen,
                 animated: Bool = true,
                 completion: (() -> Void)? = nil) {
        guard let viewController = storyboard.instantiateInitialViewController() else {
            return
        }
        
        viewController.modalPresentationStyle = modalPresentationStyle
        present(viewController, animated: animated, completion: completion)
    }
}
