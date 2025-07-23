//
//  MockRegisterRouter.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 23/07/25.
//

import XCTest
@testable import GopeTalkie

class MockRegisterRouter: RegisterRouterProtocol {
    static func createModule() -> UIViewController {
        return UIViewController()
    }
}
