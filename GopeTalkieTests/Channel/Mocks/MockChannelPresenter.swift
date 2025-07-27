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
    
    func didReceivePermissionToSpeak() {}
    
    func didFetchUsers(_ emails: [String]) {
        fetchedEmails = emails
    }
}
