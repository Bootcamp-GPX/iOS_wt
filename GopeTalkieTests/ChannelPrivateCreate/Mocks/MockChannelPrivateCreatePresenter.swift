//
//  MockChannelPrivateCreatePresenter.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 13/10/25.
//

import Foundation
@testable import GopeTalkie

class MockChannelPrivateCreatePresenter: ChannelPrivateCreateInteractorOutputProtocol {
    var didCreateChannelCalled = false
    var didFailToCreateChannelCalled = false
    var error: Error?

    func didCreateChannel() {
        didCreateChannelCalled = true
    }

    func didFailToCreateChannel(with error: Error) {
        didFailToCreateChannelCalled = true
        self.error = error
    }
}
