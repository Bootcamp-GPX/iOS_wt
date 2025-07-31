//
//  MockChannelsRouter.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 25/07/25.
//

import XCTest
@testable import GopeTalkie

final class MockChannelsRouter: ChannelsRouterProtocol {
    var navigatedChannel: Channel?
    var logoutMessage: String?

    static func createModule(onChannelSelected: @escaping (GopeTalkie.Channel) -> Void) -> UIViewController {
        return UIViewController()
    }

    func navigateToChannel(from view: ChannelsViewProtocol, with channel: Channel) {
        navigatedChannel = channel
    }

    func navigateToLogin(with message: String) {
        logoutMessage = message
    }
}
