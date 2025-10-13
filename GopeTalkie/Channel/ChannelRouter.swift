//
//  HomeRouter.swift
//  GopeTalkie
//
//  Created by Gopenux on 16/07/25.
//

import UIKit

final class ChannelRouter: ChannelRouterProtocol {
    weak var viewController: UIViewController?
    
    static func createModule(with channel: Channel? = nil) -> UIViewController {
        let view = ChannelViewController(nibName: "ChannelViewController", bundle: nil)
        let presenter = ChannelPresenter(channel: channel)
        let interactor = ChannelInteractor(channel: channel)
        let router = ChannelRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
    
    func presentChannelsModally(from view: ChannelViewProtocol) {
        let channelsVC = ChannelsRouter.createModule { [weak self] selectedChannel in
            self?.replaceCurrentChannel(with: selectedChannel)
        }
        
        let navController = UINavigationController(rootViewController: channelsVC)
        navController.modalPresentationStyle = .pageSheet
        
        if let sheet = navController.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 20
        }
        
        if let viewController = view as? UIViewController {
            viewController.present(navController, animated: true)
        }
    }
    
    private func replaceCurrentChannel(with channel: Channel) {
        if let currentVC = viewController as? ChannelViewController,
           let interactor = currentVC.presenter?.interactor {
            interactor.disconnectFromChannel()
        }
        viewController?.presentedViewController?.dismiss(animated: true)
        
        let newChannelVC = ChannelRouter.createModule(with: channel)
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let keyWindow = windowScene.windows.first(where: { $0.isKeyWindow }),
           let navController = keyWindow.rootViewController as? UINavigationController {
            navController.setViewControllers([newChannelVC], animated: false)
        }
    }

    func navigateToChannelPrivateCreate(from view: ChannelViewProtocol) {
        let channelPrivateCreateVC = ChannelPrivateCreateRouter.createModule()
        if let vc = view as? UIViewController {
            vc.navigationController?.setViewControllers([channelPrivateCreateVC], animated: true)
        }
    }
    
    func navigateToSettings(from view: ChannelViewProtocol) {
        let settingsVC = SettingsRouter.createModule()
        if let vc = view as? UIViewController {
            vc.navigationController?.pushViewController(settingsVC, animated: true)
        }
    }
}
