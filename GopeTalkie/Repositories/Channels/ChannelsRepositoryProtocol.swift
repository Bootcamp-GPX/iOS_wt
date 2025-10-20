//
//  ChannelsRepositoryProtocol.swift
//  GopeTalkie
//
//  Created by Gopenux on 29/08/25.
//

protocol ChannelsRepositoryProtocol {
    func fetchPublicChannels(completion: @escaping (Result<[Channel], Error>) -> Void)
    func fetchPrivateChannels(completion: @escaping (Result<[Channel], Error>) -> Void)
}
