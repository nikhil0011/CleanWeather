//
//  AppDelegate.swift
//  CleanWeather
//
//  Created by Nikhil Nangia on 12/03/22.
//

import UIKit
let LColor = Theme.shared.light
let DColor = Theme.shared.dark
let AppFont = Theme.shared.font

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        overrideApplicationThemeStyle()
        Theme.shared.setStyle(app: .recipe, font: nil)
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}

extension AppDelegate {
    func overrideApplicationThemeStyle() {
        if #available(iOS 13.0, *) {
            UIApplication.shared.keyWindow?.overrideUserInterfaceStyle = .light
        } else {
        }
    }
}
