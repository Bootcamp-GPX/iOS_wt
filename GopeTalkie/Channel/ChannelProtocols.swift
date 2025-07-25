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
    func displayUsers(_ emails: [String])
}

protocol ChannelPresenterProtocol: AnyObject {
    func viewDidLoad()
    func startTalking()
    func stopTalking()
    func didTapExit()
    func refreshUsers()
}

protocol ChannelInteractorProtocol: AnyObject {
    func connectToChannel(named name: String)
    func startTalking()
    func stopTalking()
    func disconnectFromChannel()
    func fetchUsersInChannel(named channelName: String)
}

protocol ChannelInteractorOutputProtocol: AnyObject {
    func didReceivePermissionToSpeak()
    func didFetchUsers(_ emails: [String])
}

protocol ChannelRouterProtocol: AnyObject {
    static func createModule(with channel: Channel) -> UIViewController
    func navigateToChannels(from view: ChannelViewProtocol)}
