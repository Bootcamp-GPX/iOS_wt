//
//  ChannelPrivateCreateRepositoryProtocol.swift
//  GopeTalkie
//
//  Created by Gopenux on 10/10/25.
//

import Foundation

protocol ChannelPrivateCreateRepositoryProtocol {
    func createChannel(request: ChannelPrivateCreateRequest, completion: @escaping (Result<ChannelPrivateCreateResponse, Error>) -> Void)
}