//
//  MockListUsersRepository.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 13/10/25.
//

import Foundation
@testable import GopeTalkie

class MockListUsersRepository: ListUsersRepositoryProtocol {
    var result: Result<[String], Error>!
    var fetchUsersCalled = false

    func fetchUsers(for channelName: String, completion: @escaping (Result<[String], Error>) -> Void) {
        fetchUsersCalled = true
        completion(result)
    }
}
