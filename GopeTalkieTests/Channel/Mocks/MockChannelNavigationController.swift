//
//  MockChannelNavigationController.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 26/07/25.
//

import XCTest
@testable import GopeTalkie

final class MockChannelNavigationController: UINavigationController {
    var didSetViewControllers = false
    var setViewControllersCalledWith: [UIViewController]?

    override func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
        didSetViewControllers = true
        setViewControllersCalledWith = viewControllers
        super.setViewControllers(viewControllers, animated: animated)
    }
}
