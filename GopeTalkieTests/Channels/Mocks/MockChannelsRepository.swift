//
//  MockChannelsRepository.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 25/07/25.
//

import XCTest
@testable import GopeTalkie

final class MockChannelsRepository: ChannelsRepositoryProtocol {
    var publicChannelsResult: Result<[Channel], Error>?
    var privateChannelsResult: Result<[Channel], Error>?

    func fetchPublicChannels(completion: @escaping (Result<[Channel], Error>) -> Void) {
        if let result = publicChannelsResult {
            completion(result)
        }
    }

    func fetchPrivateChannels(completion: @escaping (Result<[Channel], Error>) -> Void) {
        if let result = privateChannelsResult {
            completion(result)
        }
    }
}
