//
//  UIViewControllerRoutingProtocol.swift
//  KIKI
//
//  Created by Fares Ajimi on 2/12/2021.
//

import UIKit

protocol UIViewControllerRoutingProtocol: AnyObject {
//    func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?)
//    func show(_ viewController: UIViewController, sender: Any?)
    func pushViewController(_ viewController: UIViewController, animated: Bool)
    func popViewController(animated: Bool)
    func dismiss(animated: Bool, completion: (() -> Void)?)
}

extension UIViewControllerRoutingProtocol where Self: UIViewController {
    func pushViewController(_ viewController: UIViewController, animated: Bool) {
        navigationController?.pushViewController(viewController, animated: animated)
    }

    func popViewController(animated: Bool) {
        navigationController?.popViewController(animated: animated)
    }
}
