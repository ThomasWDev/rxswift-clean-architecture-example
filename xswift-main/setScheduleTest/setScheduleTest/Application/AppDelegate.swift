//
//  AppDelegate.swift
//  tawktestios
//
//  Created by Thomas Woodfin on 7/23/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var coordinator: SearchCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //build app configuration
        buildAppConfig()
        
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
       
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
    
    private func buildAppConfig() -> Void {
        let theme = AppTheme.Builder()
            .addColors(colors: Colors())
            .addFonts(fonts: Fonts())
            .build()

        //server/api config builder
        let serverConfig = ServerConfig.Builder()
            .addBaseUrl(baseUrl: "https://api.themoviedb.org")
            .addApiVersion(apiVersion: "3")
            .addAuthCredential(credential: AuthCredential(apiKey: "feb6f0eeaa0a72662967d77079850353"))
            .addMediaBaseUrl(mediaBaseUrl: "https://image.tmdb.org/t/p/w500")
            .addBuildType(buildType: .DEVELOP)
            .build()

        //Singleton with builder, commit-> no return
        AppConfig.Builder()
            .setServerConfig(serverConfig: serverConfig)
            .setThemeType(themeType: .NORMAL)
            .setNormalTheme(theme: theme)
            .setDarkTheme(theme: theme)
            .setLocale(local: "en")
            .commit()
    }

}

