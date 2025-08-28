//
//  ChannelInteractorTests.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 26/07/25.
//

import XCTest
@testable import GopeTalkie

final class ChannelInteractorTests: XCTestCase {
    var interactor: ChannelInteractor!
    var mockSocket: MockWebSocketService!
    var mockAudioService: MockAudioService!
    var mockUsersRepository: MockChannelUsersRepository!
    var mockPresenter: MockChannelPresenter!

    override func setUp() {
        super.setUp()
        mockSocket = MockWebSocketService()
        mockAudioService = MockAudioService()
        mockUsersRepository = MockChannelUsersRepository()
        mockPresenter = MockChannelPresenter()

        interactor = ChannelInteractor(
            channel: Channel(name: "TestChannel"),
            socket: mockSocket,
            audioService: mockAudioService,
            usersRepository: mockUsersRepository
        )
        interactor.presenter = mockPresenter
    }

    func testConnectToChannelShouldStartAndStopStreaming() {
        interactor.connectToChannel(named: "TestChannel")

        XCTAssertEqual(mockSocket.connectedChannel, "TestChannel")
        XCTAssertTrue(mockAudioService.startStreamingCalled)
        XCTAssertTrue(mockAudioService.stopStreamingCalled)
    }

    func testStartTalkingShouldSendStartAndStartStreaming() {
        interactor.startTalking()

        XCTAssertTrue(mockAudioService.startStreamingCalled)
    }

    func testStopTalkingShouldSendStopAndStopStreaming() {
        interactor.stopTalking()

        XCTAssertTrue(mockAudioService.stopStreamingCalled)
    }

    func testDisconnectFromChannelShouldCallDisconnect() {
        interactor.disconnectFromChannel()

        XCTAssertTrue(mockSocket.disconnectCalled)
    }

    func testFetchUsersSuccessShouldNotifyPresenter() {
        let expectedUsers = ["a@a.com", "b@b.com"]
        mockUsersRepository.resultToReturn = .success(expectedUsers)

        interactor.fetchUsersInChannel(named: "TestChannel")

        XCTAssertEqual(mockPresenter.fetchedEmails, expectedUsers)
    }

    func testFetchUsersFailureShouldNotNotifyPresenter() {
        mockUsersRepository.resultToReturn = .failure(NSError(domain: "TestError", code: 1))

        interactor.fetchUsersInChannel(named: "TestChannel")

        XCTAssertNil(mockPresenter.fetchedEmails)
    }

    func testLogoutShouldClearTokenAndNotifyPresenter() {
        interactor.logout()
        
        XCTAssertEqual(mockPresenter.logoutMessage, "Sesión cerrada exitosamente")
    }
}
