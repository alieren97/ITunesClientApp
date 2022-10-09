//
//  AppDelegate.swift
//  ITunesClientApp
//
//  Created by Ali Eren on 7.10.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window : UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?)
    -> Bool {
        
        self.window = self.window ?? UIWindow()
        let mainViewController = MainViewController()
        let navigationController = UINavigationController(rootViewController: mainViewController)
        self.window!.rootViewController = navigationController
        self.window!.makeKeyAndVisible()
        
        return true
    }

}

