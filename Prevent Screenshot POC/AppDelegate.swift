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
    private var fullScreenBlockerImageview : BlockerRecordingView?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "ViewController")
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = mainViewController
        window?.makeKeyAndVisible()
        
        listenForScreenRecordingNotification()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        showBLockerImageView()
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        hideBlockerImageView()
    }
}

private extension AppDelegate {
    func showBLockerImageView() {
        fullScreenBlockerImageview = BlockerRecordingView()
        window?.addSubview(fullScreenBlockerImageview!)
        fullScreenBlockerImageview?.frame = window?.bounds ?? .zero
    }
    
    func hideBlockerImageView() {
        if fullScreenBlockerImageview != nil {
            fullScreenBlockerImageview?.removeFromSuperview()
            fullScreenBlockerImageview = nil
        }
    }
    
    func listenForScreenRecordingNotification() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(screenCaptureDidChange),
            name: UIScreen.capturedDidChangeNotification,
            object: nil
        )
    }
    
    @objc
    func screenCaptureDidChange() {
        debugPrint("screenCaptureDidChange.. isCapturing: \(UIScreen.main.isCaptured)")
        
        UIScreen.main.isCaptured ? showBLockerImageView() : hideBlockerImageView()
    }
}

