//
//  MockChannelPrivateJoinPresenter.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 13/10/25.
//

import Foundation
@testable import GopeTalkie

class MockChannelPrivateJoinPresenter: ChannelPrivateJoinInteractorOutputProtocol {
    var didJoinChannelCalled = false
    var didFailToJoinChannelCalled = false
    var response: ChannelPrivateJoinResponse?
    var error: Error?

    func didJoinChannel(response: ChannelPrivateJoinResponse) {
        didJoinChannelCalled = true
        self.response = response
    }

    func didFailToJoinChannel(with error: Error) {
        didFailToJoinChannelCalled = true
        self.error = error
    }
}
