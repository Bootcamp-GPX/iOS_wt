//
//  MockChannelPrivateJoinRouter.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 13/10/25.
//

import UIKit
@testable import GopeTalkie

class MockChannelPrivateJoinRouter: ChannelPrivateJoinRouterProtocol {
    var dismissCalled = false

    static func createModule() -> UIViewController {
        return UIViewController()
    }

    func dismiss() {
        dismissCalled = true
    }
}
