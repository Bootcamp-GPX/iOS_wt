//
//  HomeProtocols.swift
//  GopeTalkie
//
//  Created by Gopenux on 16/07/25.
//

import Foundation
import UIKit

protocol ChannelViewProtocol: AnyObject {
    func setChannelName(_ name: String)
    func showLogoutError(_ message: String)
}

protocol ChannelPresenterProtocol: AnyObject {
    func didTapLogout()
    func viewDidLoad()
    func startTalking()
    func stopTalking()
    func didTapExit()
}

protocol ChannelInteractorProtocol: AnyObject {
    func connectToChannel(named name: String)
    func startTalking()
    func stopTalking()
    func disconnectFromChannel()
    func logout()
}

protocol ChannelInteractorOutputProtocol: AnyObject {
    func logoutSucceeded(message: String)
    func logoutFailed(with error: Error)
    func didReceivePermissionToSpeak()
}

protocol ChannelRouterProtocol: AnyObject {
    static func createModule(with channel: Channel) -> UIViewController
    func navigateToLogin(with message: String)
    func navigateToChannels()
}
