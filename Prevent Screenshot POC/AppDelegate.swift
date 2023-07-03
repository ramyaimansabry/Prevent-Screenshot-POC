//
//  AppDelegate.swift
//  Prevent Screenshot POC
//
//  Created by Ramy Sabry on 10/09/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var imageview : UIImageView?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "ViewController")
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = mainViewController
        window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        let image = UIImage(named: "color-image")
        imageview = UIImageView(image: image)
        imageview?.contentMode = .scaleAspectFill
        window?.addSubview(imageview!)
        imageview?.frame = window?.bounds ?? .zero
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        if imageview != nil {
            imageview?.removeFromSuperview()
            imageview = nil
        }
        print("application")
    }
}

