//
//  SettingsInteractorTests.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 12/10/25.
//

import XCTest
@testable import GopeTalkie

final class SettingsInteractorTests: XCTestCase {
    var interactor: SettingsInteractor!
    var mockPresenter: MockSettingsPresenter!

    override func setUp() {
        super.setUp()
        interactor = SettingsInteractor()
        mockPresenter = MockSettingsPresenter()
        interactor.presenter = mockPresenter
        
        TokenManager.clear()
    }

    override func tearDown() {
        TokenManager.clear()
        super.tearDown()
    }

    func testPerformLogoutClearsTokenAndNotifiesPresenter() {
        TokenManager.accessToken = "dummy-token"
        XCTAssertNotNil(TokenManager.accessToken, "Precondition: Token should exist before logout")

        interactor.performLogout()

        XCTAssertNil(TokenManager.accessToken, "Token should be nil after logout")
        XCTAssertTrue(mockPresenter.didLogoutSuccessfullyCalled, "Presenter should be notified of successful logout")
    }
}
