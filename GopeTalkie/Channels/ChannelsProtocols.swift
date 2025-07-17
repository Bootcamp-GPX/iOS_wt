//
//  ChannelsProtocols.swift
//  GopeTalkie
//
//  Created by Gopenux on 17/07/25.
//

import Foundation
import UIKit

protocol ChannelsViewProtocol: AnyObject {
    func reloadData()
    func showError(message: String)
}

protocol ChannelsPresenterProtocol: AnyObject {
    func didTapLogout()
    var channelsCount: Int { get }
    func viewDidLoad()
    func configure(cell: ChannelsTableViewCell, at index: Int)
    func didSelectChannel(at index: Int)
}

protocol ChannelsInteractorProtocol: AnyObject {
    func loadChannels()
    func logout()
}

protocol ChannelsInteractorOutput: AnyObject {
    func logoutSucceeded(message: String)
    func logoutFailed(with error: Error)
    func didLoadChannels(_ channels: [Channel])
    func didFailLoadingChannels(error: Error)
}

protocol ChannelsRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
    func navigateToChannel(with channel: Channel)
    func navigateToLogin(with message: String)
}
