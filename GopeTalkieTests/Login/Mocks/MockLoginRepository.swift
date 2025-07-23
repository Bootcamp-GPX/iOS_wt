//
//  MockLoginRepository.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 23/07/25.
//

import XCTest
@testable import GopeTalkie

final class MockLoginRepository: LoginRepositoryProtocol {
    var lastRequest: LoginRequest?
    var resultToReturn: Result<LoginResponse, Error>?

    func login(request: LoginRequest, completion: @escaping (Result<LoginResponse, Error>) -> Void) {
        lastRequest = request
        if let result = resultToReturn {
            completion(result)
        }
    }
}
