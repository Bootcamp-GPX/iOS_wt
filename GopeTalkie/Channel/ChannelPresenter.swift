//
//  HomePresenter.swift
//  GopeTalkie
//
//  Created by Gopenux on 16/07/25.
//

import Foundation

final class ChannelPresenter: ChannelPresenterProtocol {
    weak var view: ChannelViewProtocol?
    var interactor: ChannelInteractorProtocol?
    var router: ChannelRouterProtocol?
    
    private let channel: Channel
    
    init(channel: Channel) {
        self.channel = channel
    }

    func viewDidLoad() {
        interactor?.connectToChannel(named: channel.name)
        view?.setChannelName(channel.name)
        interactor?.fetchUsersInChannel(named: channel.name)
    }

    func startTalking() {
        interactor?.startTalking()
    }

    func stopTalking() {
        interactor?.stopTalking()
    }
    
    func didTapExit() {
        interactor?.disconnectFromChannel()
        router?.navigateToChannels()
    }
    
    func refreshUsers() {
        interactor?.fetchUsersInChannel(named: channel.name)
    }
}

extension ChannelPresenter: ChannelInteractorOutputProtocol {
    func didReceivePermissionToSpeak() {
        print("🎙️ Tienes permiso para hablar")
    }
    
    func didFetchUsers(_ emails: [String]) {
        print("👥 Emails recibidos en presenter: \(emails)")
        view?.displayUsers(emails)
    }
}
