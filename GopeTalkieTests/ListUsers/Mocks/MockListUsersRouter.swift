//
//  MockListUsersRouter.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 13/10/25.
//

import UIKit
@testable import GopeTalkie

class MockListUsersRouter: ListUsersRouterProtocol {
    static func createModule(with channelName: String) -> UIViewController {
        return UIViewController()
    }
}
