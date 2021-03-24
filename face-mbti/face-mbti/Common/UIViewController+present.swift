//
//  UIViewController+present.swift
//  face-mbti
//
//  Created by 현기엽 on 2021/03/22.
//

import UIKit
import Rswift

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
    
    func present(_ storyboard: StoryboardResourceType,
                 modalPresentationStyle: UIModalPresentationStyle = .fullScreen,
                 animated: Bool = true,
                 completion: (() -> Void)? = nil) {
        present(
            UIStoryboard(name: storyboard.name, bundle: storyboard.bundle),
            modalPresentationStyle: modalPresentationStyle,
            animated: animated,
            completion: completion
        )
    }
}
