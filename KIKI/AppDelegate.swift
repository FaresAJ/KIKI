//
//  AppDelegate.swift
//  KIKI
//
//  Created by Fares Ajimi on 9/11/2021.
//

import GooglePlaces
import GoogleMaps
import Swinject
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties

    var window: UIWindow?
    var assembler: Assembler?
    var rootViewController: UIViewController? {
        get { return self.window?.rootViewController }
        set {
            self.window?.rootViewController = newValue
            self.window?.makeKeyAndVisible()
        }
    }

    // MARK: - App Delegate methods

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setUpGoogleMapsConfig()
        initDependencyInjection()
        initRootView()
        return true
    }

    // MARK: - DI

    func initDependencyInjection() {
        assembler = Assembler([
            SharedAssembly(),
            DeliveryAssembly(),
            NotificationAssembly(),
            LoginAssembly(),
            MapAssembly(),
            OrderAssembly()
        ])
    }

    func initRootView() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let rootTabBarViewController = assembler?.resolver.resolve(TabBarViewControllerProtocol.self)!
        guard let rootViewController = rootTabBarViewController as? UITabBarController else { return }
        self.rootViewController = rootViewController
    }

    // MARK: - Config

    func setUpGoogleMapsConfig() {
        GMSServices.provideAPIKey(ApiKeys.googleMapClientKey)
        GMSPlacesClient.provideAPIKey(ApiKeys.googleMapPlacesKey)
    }
}
