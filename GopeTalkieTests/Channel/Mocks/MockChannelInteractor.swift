//
//  MockChannelInteractor.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 26/07/25.
//

import XCTest
@testable import GopeTalkie

final class MockChannelInteractor: ChannelInteractorProtocol {
    var logoutCalled = false
    var connectCalled = false
    var startTalkingCalled = false
    var stopTalkingCalled = false
    var disconnectCalled = false
    var fetchUsersCalled = false

    func logout() {
        logoutCalled = true
    }
    
    func connectToChannel(named name: String) {
        connectCalled = true
    }

    func startTalking() {
        startTalkingCalled = true
    }

    func stopTalking() {
        stopTalkingCalled = true
    }

    func disconnectFromChannel() {
        disconnectCalled = true
    }

    func fetchUsersInChannel(named channelName: String) {
        fetchUsersCalled = true
    }
}
