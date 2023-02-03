//
//  SSageNutritionApp.swift
//  SSageNutrition
//
//  Created by Jacqueline Hopkins on 1/25/23.
//

import SwiftUI
import FirebaseCore

@main
struct SSageNutritionApp: App {
    @StateObject var model = ViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            let appViewModel = AppViewModel()
            ContentView()
                .environmentObject(appViewModel)
        }
    }
}
//import UIKit
//import FirebaseCore
//
//
//@UIApplicationMain
//class AppDelegate: UIResponder, UIApplicationDelegate {
//
//  var window: UIWindow?
//
//  func application(_ application: UIApplication,
//    didFinishLaunchingWithOptions launchOptions:
//                   [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//    FirebaseApp.configure()
//
//    return true
//  }
//}
