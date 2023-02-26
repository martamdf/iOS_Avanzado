//
//  AppDelegate.swift
//  proyecto_iOSavanzado
//
//  Created by Marta Maquedano on 24/2/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var coreDataManager: CoreDataManager = .init(modelName: "Hero")

    static let sharedAppDelegate: AppDelegate = {
       
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Error during app delegate creation")
        }
        
        return delegate
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
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

