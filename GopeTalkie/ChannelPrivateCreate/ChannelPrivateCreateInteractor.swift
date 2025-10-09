//
//  ChannelPrivateCreateInteractor.swift
//  GopeTalkie
//
//  Created by Gopenux on 9/10/25.
//

import Foundation

final class ChannelPrivateCreateInteractor: ChannelPrivateCreateInteractorInputProtocol {
    weak var presenter: ChannelPrivateCreateInteractorOutputProtocol?
    private let repository: ChannelsRepositoryProtocol
    
    init(repository: ChannelsRepositoryProtocol = ChannelsRepository()) {
        self.repository = repository
    }
    
    func createChannel() {
    }
}
