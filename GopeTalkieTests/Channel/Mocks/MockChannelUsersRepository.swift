//
//  MockChannelUsersRepository.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 31/07/25.
//

import XCTest
@testable import GopeTalkie

final class MockChannelUsersRepository: ChannelUsersRepositoryProtocol {
    var mockResult: Result<[String], Error>?

    func fetchUsers(for channelName: String, completion: @escaping (Result<[String], Error>) -> Void) {
        if let result = mockResult {
            completion(result)
        }
    }
}
