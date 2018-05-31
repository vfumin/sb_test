//
//  AppDelegate.swift
//  Task
//
//  Created by Fumin Vladimir on 30.05.2018.
//  Copyright © 2018 Fumin Vladimir. All rights reserved.
//

import UIKit
import SciChart

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let licencing = """
      <LicenseContract>
  <Customer>v.fumin@gmail.com</Customer>
  <OrderId>Trial</OrderId>
  <LicenseCount>1</LicenseCount>
  <IsTrialLicense>true</IsTrialLicense>
  <SupportExpires>06/29/2018 00:00:00</SupportExpires>
  <ProductCode>SC-IOS-2D-ENTERPRISE-SRC</ProductCode>
  <KeyCode>b98ed19bb386575f5c3b160ca89ea948266a39b7cb42026fe8776d0734f58740102caac254dd157181933079f392cf064c0a52ee83e23625df5d709b57b2498dccf1cfb3607a7af03d71ad27a207fac4c38e83ffe9f8c163926df5b5136baef59619919ba64d0eb28e030ca1308cfed9307eb066cec50304dbf28d65cf59d783c371548c87ef96e4cd13e544d2fe99e4b9842d0014e1370ce1e2e7fb124a0a458b8eefa5203701</KeyCode>
</LicenseContract>
"""
        SCIChartSurface.setRuntimeLicenseKey(licencing)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

