//
//  SceneDelegate.swift
//  GopeTalkie
//
//  Created by Gopenux on 15/07/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let initialViewController: UIViewController
        
        if let token = TokenManager.accessToken, !token.isEmpty {
            print("Token detectado al iniciar la app:", token)
            initialViewController = ChannelsRouter.createModule()
        } else {
            print("No hay token al iniciar la app")
            initialViewController = LoginRouter.createModule()
        }
        
        let navController = UINavigationController(rootViewController: initialViewController)
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navController
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.fromHex("#4b0082")
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().tintColor = .white
        
        self.window?.makeKeyAndVisible()
        setupTokenExpirationHandler()
    }
    
    private func setupTokenExpirationHandler() {
        NotificationCenter.default.addObserver(
            forName: .tokenExpired,
            object: nil,
            queue: .main
        ) { [weak self] _ in
            TokenManager.clear()
            
            let loginVC = LoginRouter.createModule()
            let navController = UINavigationController(rootViewController: loginVC)
            self?.window?.rootViewController = navController
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                let alert = UIAlertController(
                    title: "Sesión expirada",
                    message: "Por seguridad, se ha cerrado tu sesión. Por favor vuelve a iniciar.",
                    preferredStyle: .alert
                )
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                navController.present(alert, animated: true)
            }
        }
    }
}
