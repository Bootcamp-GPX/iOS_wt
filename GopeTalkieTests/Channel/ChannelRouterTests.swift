//
//  ChannelRouterTests.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 26/07/25.
//

import XCTest
@testable import GopeTalkie

final class ChannelRouterTests: XCTestCase {
    
    func testCreateModuleAssemblesAllDependenciesCorrectly() {
        let channel = Channel(name: "TestChannel")
        let viewController = ChannelRouter.createModule(with: channel)

        XCTAssertTrue(viewController is ChannelViewController)

        let view = viewController as! ChannelViewController
        XCTAssertNotNil(view.presenter)

        let presenter = view.presenter as! ChannelPresenter
        XCTAssertNotNil(presenter.view)
        XCTAssertNotNil(presenter.interactor)
        XCTAssertNotNil(presenter.router)

        let interactor = presenter.interactor as! ChannelInteractor
        XCTAssertNotNil(interactor.presenter)

        let router = presenter.router as! ChannelRouter
        XCTAssertEqual(router.viewController, view)
    }
    
    func testNavigateToLoginReplacesRootViewControllerAndPresentsAlert() {
        let router = ChannelRouter()
        let mockScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let mockWindow = UIWindow(windowScene: mockScene!)
        let mockSceneDelegate = mockScene?.delegate as? SceneDelegate
        mockSceneDelegate?.window = mockWindow

        router.navigateToLogin(with: "Token expirado")

        let navController = mockWindow.rootViewController as? UINavigationController
        XCTAssertNotNil(navController, "Expected UINavigationController as rootViewController")
        XCTAssertTrue(navController?.viewControllers.first is LoginViewController)
    }
}
