//
//  HomeRouter.swift
//  GopeTalkie
//
//  Created by Gopenux on 16/07/25.
//

import UIKit

final class ChannelRouter: ChannelRouterProtocol {
    weak var viewController: UIViewController?
    
    static func createModule(with channel: Channel) -> UIViewController {
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
        
    func navigateToChannels() {
        let channelsVC = ChannelsRouter.createModule()
        viewController?.navigationController?.setViewControllers([channelsVC], animated: true)
    }
}
