//
//  MockNavigationController.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 23/07/25.
//

import XCTest
@testable import GopeTalkie

final class MockNavigationController: UINavigationController {
    var lastPushedViewController: UIViewController?

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        lastPushedViewController = viewController
        super.pushViewController(viewController, animated: animated)
    }
}

final class MockLoginViewController: UIViewController, LoginViewProtocol {
    var presentedVC: UIViewController?
    var presentedStyle: UIModalPresentationStyle?

    func showError(_ message: String) {}

    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        presentedVC = viewControllerToPresent
        presentedStyle = viewControllerToPresent.modalPresentationStyle
        super.present(viewControllerToPresent, animated: false, completion: completion)
    }
}
