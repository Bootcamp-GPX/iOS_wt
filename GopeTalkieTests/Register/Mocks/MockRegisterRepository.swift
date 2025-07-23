//
//  MockRegisterRepository.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 23/07/25.
//

import XCTest
@testable import GopeTalkie

class MockRegisterRepository: RegisterRepositoryProtocol {
    var capturedRequest: RegisterRequest?
    var completionHandler: ((Result<RegisterResponse, Error>) -> Void)?

    func register(user: RegisterRequest, completion: @escaping (Result<RegisterResponse, Error>) -> Void) {
        capturedRequest = user
        completionHandler = completion
    }

    func simulateSuccess(message: String) {
        let response = RegisterResponse(message: message)
        completionHandler?(.success(response))
    }

    func simulateFailure(error: Error) {
        completionHandler?(.failure(error))
    }
}
