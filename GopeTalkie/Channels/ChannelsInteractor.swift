//
//  ChannelsInteractor.swift
//  GopeTalkie
//
//  Created by Gopenux on 17/07/25.
//

import Foundation

class ChannelsInteractor: ChannelsInteractorProtocol {
    weak var presenter: ChannelsInteractorOutput?
    private let repository: ChannelsRepositoryProtocol

    init(repository: ChannelsRepositoryProtocol = ChannelsRepository()) {
        self.repository = repository
    }

    func loadChannels() {
        repository.fetchChannels { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let channels):
                    self?.presenter?.didLoadChannels(channels)
                case .failure(let error):
                    self?.presenter?.didFailLoadingChannels(error: error)
                }
            }
        }
    }
}
