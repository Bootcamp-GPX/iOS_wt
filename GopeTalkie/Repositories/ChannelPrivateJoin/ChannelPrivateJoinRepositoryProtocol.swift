//
//  ChannelPrivateJoinRepositoryProtocol.swift
//  GopeTalkie
//
//  Created by Gopenux on 11/10/25.
//

import Foundation

protocol ChannelPrivateJoinRepositoryProtocol {
    func joinChannel(request: ChannelPrivateJoinRequest, completion: @escaping (Result<ChannelPrivateJoinResponse, Error>) -> Void)
}
