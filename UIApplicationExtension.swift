//
//  UIApplicationExtension.swift
//  Kum-n-GoLoyaltyApp
//
//  Created by Satyadev Chauhan on 11/06/19.
//  Copyright © 2019 Mobiquity, Inc. All rights reserved.
//

import UIKit

extension UIApplication {
    
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
    
    class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return topViewController(base: selected)
        }
        else if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        
        return base
    }
    
    @objc class func appVersion() -> String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    }
    
    class func appBuild() -> String {
        return Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as! String
    }
    
    class func versionBuild() -> String {
        let version = appVersion()
        let build = appBuild()
        return version == build ? "v\(version)" : "v\(version)(\(build))"
    }
    
    class func hasSafeAreaScreen() -> (Bool) {
        if #available(iOS 11.0, *) {
            return CGFloat(UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0) > 0
        } else {
            return false
        }
    }
    
    @objc class func isFirstLaunch() -> Bool {
        if !UserDefaults.standard.bool(forKey: "hasBeenLaunchedBefore") {
            UserDefaults.standard.set(true, forKey: "hasBeenLaunchedBefore")
            UserDefaults.standard.synchronize()
            return true
        }
        return false
    }

    class func isRegisteredNotifications() -> Bool {
        if #available(iOS 10.0, *) {
            var isRegistered = false
            let semaphore = DispatchSemaphore(value: 0)
            let current = UNUserNotificationCenter.current()
            current.getNotificationSettings(completionHandler: { settings in
                
                if settings.authorizationStatus == .authorized {
                    isRegistered = true
                } else if #available(iOS 12.0, *), settings.authorizationStatus == .provisional {
                    isRegistered = true
                } else {
                    isRegistered = false
                }
                
                semaphore.signal()
            })
            _ = semaphore.wait(timeout: .now() + 5)
            return isRegistered
        } else {
            return UIApplication.shared.isRegisteredForRemoteNotifications
        }
    }
    

}
