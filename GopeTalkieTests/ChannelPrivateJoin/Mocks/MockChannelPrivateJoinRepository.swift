//
//  MockChannelPrivateJoinRepository.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 13/10/25.
//

import Foundation
@testable import GopeTalkie

class MockChannelPrivateJoinRepository: ChannelPrivateJoinRepositoryProtocol {
    var result: Result<ChannelPrivateJoinResponse, Error>!
    var joinChannelCalled = false

    func joinChannel(request: ChannelPrivateJoinRequest, completion: @escaping (Result<ChannelPrivateJoinResponse, Error>) -> Void) {
        joinChannelCalled = true
        completion(result)
    }
}
