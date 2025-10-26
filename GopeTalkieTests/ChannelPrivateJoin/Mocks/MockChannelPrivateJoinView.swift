//
//  MockChannelPrivateJoinView.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 13/10/25.
//

import Foundation
@testable import GopeTalkie

class MockChannelPrivateJoinView: ChannelPrivateJoinViewProtocol {
    var showErrorCalled = false
    var showSuccessCalled = false
    var errorMessage: String?
    var successMessage: String?

    func showError(error: String) {
        showErrorCalled = true
        errorMessage = error
    }

    func showSuccess(message: String) {
        showSuccessCalled = true
        successMessage = message
    }
}
