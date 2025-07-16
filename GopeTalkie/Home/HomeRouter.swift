//
//  HomeRouter.swift
//  GopeTalkie
//
//  Created by Gopenux on 16/07/25.
//

import UIKit

final class HomeRouter: HomeRouterProtocol {
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let view = HomeViewController()
        let presenter = HomePresenter()
        let interactor = HomeInteractor()
        let router = HomeRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
    
    func navigateToLogin(with message: String) {
        let loginVC = LoginRouter.createModule()
        let navController = UINavigationController(rootViewController: loginVC)
        
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let delegate = scene.delegate as? SceneDelegate {
            delegate.window?.rootViewController = navController
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                let alert = UIAlertController(
                    title: "Sesión cerrada",
                    message: message,
                    preferredStyle: .alert
                )
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                navController.present(alert, animated: true)
            }
        }
    }
}
