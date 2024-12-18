//
//  AppDelegate.swift
//  comet-chat-app
//
//  Created by Admin on 12/18/24.
//

import UIKit
import CometChatSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let appId: String = "268483d61c195c50"
    let region: String = "in"
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let appSettings = AppSettings.AppSettingsBuilder().subscribePresenceForAllUsers().setRegion(region: region).build()
        CometChat.init(appId: appId, appSettings: appSettings) { isSuccess in
            if (isSuccess) {
                print("CometChat SDK intialise successfully.")
            } else {
                fatalError("CometChat SDK failed intialization")
            }
        } onError: { error in
            fatalError("CometChat SDK failed intialise with error: \(error.description)")
        }

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

