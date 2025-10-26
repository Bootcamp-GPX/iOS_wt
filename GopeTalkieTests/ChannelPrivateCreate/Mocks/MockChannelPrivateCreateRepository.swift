//
//  MockChannelPrivateCreateRepository.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 13/10/25.
//

import Foundation
@testable import GopeTalkie

class MockChannelPrivateCreateRepository: ChannelPrivateCreateRepositoryProtocol {
    var result: Result<ChannelPrivateCreateResponse, Error>!
    var createChannelCalled = false

    func createChannel(request: ChannelPrivateCreateRequest, completion: @escaping (Result<ChannelPrivateCreateResponse, Error>) -> Void) {
        createChannelCalled = true
        completion(result)
    }
}
