//
//  MockChannelPresenter.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 26/07/25.
//

import XCTest
@testable import GopeTalkie

final class MockChannelPresenter: ChannelInteractorOutputProtocol {
    var logoutMessage: String?
    var fetchedEmails: [String]?

    func logoutSucceeded(message: String) {
        logoutMessage = message
    }

    func didReceivePermissionToSpeak() {}

    func didFetchUsers(_ emails: [String]) {
        fetchedEmails = emails
    }
}
