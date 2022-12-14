//
//  AppDelegate.swift
//  App use mobile
//
//  Created by Máira Talma on 03/06/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let viewControler = HomeViewController()
        let navigationControler = UINavigationController(rootViewController: viewControler)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationControler
        window?.makeKeyAndVisible()
        
        return true
    }

}

