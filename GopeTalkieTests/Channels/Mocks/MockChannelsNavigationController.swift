//
//  MockChannelsNavigationController.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 25/07/25.
//

import XCTest
@testable import GopeTalkie

final class MockChannelsNavigationController: UINavigationController {
    var didSetViewControllers = false
    var setViewControllersCalledWith: [UIViewController]?

    override func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
        didSetViewControllers = true
        setViewControllersCalledWith = viewControllers
        super.setViewControllers(viewControllers, animated: animated)
    }
}
