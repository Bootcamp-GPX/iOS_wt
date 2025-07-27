//
//  MockChannelRouter.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 26/07/25.
//

import XCTest
@testable import GopeTalkie

final class MockChannelRouter: ChannelRouterProtocol {
    var navigateCalled = false

    static func createModule(with channel: GopeTalkie.Channel) -> UIViewController {
        return UIViewController()
    }
    
    func navigateToChannels(from view: ChannelViewProtocol) {
        navigateCalled = true
    }
}
