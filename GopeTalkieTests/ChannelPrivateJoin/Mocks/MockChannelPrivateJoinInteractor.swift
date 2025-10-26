//
//  MockChannelPrivateJoinInteractor.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 13/10/25.
//

import Foundation
@testable import GopeTalkie

class MockChannelPrivateJoinInteractor: ChannelPrivateJoinInteractorInputProtocol {
    var presenter: ChannelPrivateJoinInteractorOutputProtocol?
    var joinChannelCalled = false
    var channelName: String?
    var pin: String?

    func joinChannel(name: String, pin: String) {
        joinChannelCalled = true
        self.channelName = name
        self.pin = pin
    }
}
