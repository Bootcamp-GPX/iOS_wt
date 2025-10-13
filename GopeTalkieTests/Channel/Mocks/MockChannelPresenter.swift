//
//  MockChannelPresenter.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 26/07/25.
//

import XCTest
@testable import GopeTalkie

final class MockChannelPresenter: ChannelInteractorOutputProtocol {
    var fetchedEmails: [String]?
    var didDisconnectCalled = false
    
    func didFetchUsers(_ emails: [String]) {
        fetchedEmails = emails
    }
    
    func didDisconnect() {
        didDisconnectCalled = true
    }
}
