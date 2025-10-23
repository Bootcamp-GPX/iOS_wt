//
//  MockChannelsInteractorOutput.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 25/07/25.
//

import XCTest
@testable import GopeTalkie

final class MockChannelsInteractorOutput: ChannelsInteractorOutput {
    var publicChannels: [Channel]?
    var privateChannels: [Channel]?
    var receivedError: Error?

    func didLoadChannels(publicChannels: [Channel], privateChannels: [Channel]) {
        self.publicChannels = publicChannels
        self.privateChannels = privateChannels
    }

    func didFailLoadingChannels(error: Error) {
        receivedError = error
    }
}
