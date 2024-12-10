//
//  TabBarViewController.swift
//  KIKI
//
//  Created by Fares Ajimi on 8/12/2021.
//

import UIKit
import Swinject

protocol TabBarViewControllerProtocol {}

class TabBarViewController: UITabBarController, TabBarViewControllerProtocol {

    var resolver: Resolver?

    class func instantiateFromNib() -> TabBarViewController {
        let nib = UINib(nibName: "TabBarViewController", bundle: nil)
        let tabBarViewController = (nib.instantiate(withOwner: nil, options: nil)
                    .first as? TabBarViewController) ?? TabBarViewController()
        return tabBarViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.setUpTabBar()
    }
    // TODO: change variables name ( secondTabViewController, thirdTabViewController ...)
    private func setUpTabBar() {
        UITabBar.appearance().unselectedItemTintColor = UIColor(red: 15, green: 22, blue: 71, alpha: 1)
        // Home View Controller in the Tab Bar
        guard let homeTabViewController = resolver?
                .resolve(DeliveryRestaurantListViewControllerProtocol.self)! as? UIViewController else { return }
        let homeVCTabBarItem = UITabBarItem(title: nil,
                                            image: UIImage(named: "DiscoveryTabBarIcon"),
                                            selectedImage: UIImage(named: "DiscoveryTabBarIconSelected"))
        let homeNavigationController = UINavigationController(rootViewController: homeTabViewController)
        homeNavigationController.tabBarItem = homeVCTabBarItem

        // 2 View Controller in the Tab Bar
        guard let orderListViewController = resolver?
            .resolve(OrderListViewControllerProtocol.self)! as? UIViewController else { return }
        let orderVCTabBarItem = UITabBarItem(title: nil,
                                              image: UIImage(named: "OrderingTabBarIcon"),
                                              selectedImage: UIImage(named: "OrderingTabBarIconSelected"))
        orderListViewController.tabBarItem = orderVCTabBarItem

        // 3 View Controller in the Tab Bar
        let thirdTabViewController = UnderConstructionViewController()
        let selectedImageThirdTabBarItem = UIImage(named: "LoyalityTabBarIconSelected")?
            .resizeImage(targetSize: CGSize(width: 70, height: 200))?.withRenderingMode(.alwaysOriginal)
        let thirdVCTabBarItem = UITabBarItem(title: nil,
                                             image: UIImage(named: "LoyalityTabBarIcon"),
                                             selectedImage: selectedImageThirdTabBarItem)
        thirdTabViewController.tabBarItem = thirdVCTabBarItem

        // 4 View Controller in the Tab Bar
        guard let notificationListViewController = resolver?
                .resolve(NotificationListViewControllerProtocol.self)! as? UIViewController else { return }
        let notificationListVCTabBarItem = UITabBarItem(title: nil,
                                             image: UIImage(named: "NotificationsTabBarIcon"),
                                             selectedImage: UIImage(named: "NotificationsTabBarIconSelected"))
        notificationListViewController.tabBarItem = notificationListVCTabBarItem

        // 5 View Controller in the Tab Bar
        guard let fifthTabViewController = resolver?
                .resolve(SignInViewControllerProtocol.self)! as? UIViewController else { return }
        let fifthVCTabBarItem = UITabBarItem(title: nil,
                                             image: UIImage(named: "OrderingTabBarIcon"),
                                             selectedImage: UIImage(named: "OrderingTabBarIconSelected"))
        fifthTabViewController.tabBarItem = fifthVCTabBarItem

        self.viewControllers = [homeNavigationController, orderListViewController,
                                thirdTabViewController, notificationListViewController, fifthTabViewController]
    }

}

extension TabBarViewController: UITabBarControllerDelegate {

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    }
}
