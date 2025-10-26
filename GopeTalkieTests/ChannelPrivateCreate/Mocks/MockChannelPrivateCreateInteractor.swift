//
//  MockChannelPrivateCreateInteractor.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 13/10/25.
//

import Foundation
@testable import GopeTalkie

class MockChannelPrivateCreateInteractor: ChannelPrivateCreateInteractorInputProtocol {
    var presenter: ChannelPrivateCreateInteractorOutputProtocol?
    var createChannelCalled = false
    var channelName: String?
    var pin: String?

    func createChannel(name: String, pin: String) {
        createChannelCalled = true
        self.channelName = name
        self.pin = pin
    }
}
