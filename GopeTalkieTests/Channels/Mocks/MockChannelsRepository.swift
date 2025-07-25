//
//  MockChannelsRepository.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 25/07/25.
//

import UIKit
@testable import GopeTalkie

final class MockChannelsRepository: ChannelsRepositoryProtocol {
    var stubbedResult: Result<[Channel], Error>?

    func fetchChannels(completion: @escaping (Result<[Channel], Error>) -> Void) {
        if let result = stubbedResult {
            completion(result)
        }
    }
}
