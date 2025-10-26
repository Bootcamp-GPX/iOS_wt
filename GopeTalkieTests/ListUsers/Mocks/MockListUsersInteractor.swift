//
//  MockListUsersInteractor.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 13/10/25.
//

import Foundation
@testable import GopeTalkie

class MockListUsersInteractor: ListUsersInteractorInputProtocol {
    var presenter: ListUsersInteractorOutputProtocol?
    var fetchUsersCalled = false

    func fetchUsers() {
        fetchUsersCalled = true
    }
}
