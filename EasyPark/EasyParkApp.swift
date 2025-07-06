//
//  EasyParkApp.swift
//  EasyPark
//
//  Created by Gursimran Singh Gill on 2023-07-21.
//

import SwiftUI
import FirebaseCore
import Core

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                       didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()

        return true
      }
}

@main
struct EasyParkApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    init() {
        FontLoader.loadFont()
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white
        
        UITabBar.appearance().standardAppearance = appearance
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
    
    var body: some Scene {
        WindowGroup {
            LoginSignupView()
        }
    }
}

class EasyParkMain {
    static let bundle = Bundle(identifier: "com.gursimran.EasyPark")!
}
