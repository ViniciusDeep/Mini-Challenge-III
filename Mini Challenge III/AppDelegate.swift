//
//  AppDelegate.swift
//  Mini Challenge III
//
//  Created by Vinicius Mangueira Correia on 22/04/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = CustomTabBarController()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {
        self.saveContext()
    }
 
    lazy var persisentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "data-base")
        
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let err = error {
                fatalError("Error in load store")
            }
        })
        return container
    }()
    
    public func saveContext() {
        let context = persisentContainer.viewContext

        if context.hasChanges {
            do {
                try context.save()
            } catch {
                fatalError()
            }
        }
        
    }
}
