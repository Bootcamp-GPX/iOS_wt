//
//  MockChannelRouter.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 26/07/25.
//

import XCTest
@testable import GopeTalkie

final class MockChannelRouter: ChannelRouterProtocol {
    var presentModalCalled = false
    var lastMessage: String?
    var navigateCalled = false

    static func createModule(with channel: GopeTalkie.Channel?) -> UIViewController {
        return UIViewController()
    }
        
    func presentChannelsModally(from view: ChannelViewProtocol) {
        presentModalCalled = true
    }

    func navigateToLogin(with message: String) {
        navigateCalled = true
        lastMessage = message
    }
}
