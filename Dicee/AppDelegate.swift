//
//  AppDelegate.swift
//  Dicee
//
//  Created by Vladimir Fibe on 23.01.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    
    let window = UIWindow(frame: UIScreen.main.bounds)
    window.rootViewController = DiceController()
    window.makeKeyAndVisible()
    self.window = window
    return true
  }
}

