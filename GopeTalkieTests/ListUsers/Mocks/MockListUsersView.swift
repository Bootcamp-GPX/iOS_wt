//
//  MockListUsersView.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 13/10/25.
//

import Foundation
@testable import GopeTalkie

class MockListUsersView: ListUsersViewProtocol {
    var reloadDataCalled = false
    var showErrorCalled = false
    var errorMessage: String?

    func reloadData() {
        reloadDataCalled = true
    }

    func showError(message: String) {
        showErrorCalled = true
        errorMessage = message
    }
}
