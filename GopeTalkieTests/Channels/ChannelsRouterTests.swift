//
//  ChannelsRouterTests.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 25/07/25.
//

import XCTest
@testable import GopeTalkie

final class ChannelsRouterTests: XCTestCase {

    func testCreateModule_AssemblesAllDependencies() {
        let viewController = ChannelsRouter.createModule()

        XCTAssertTrue(viewController is ChannelsViewController)

        let view = viewController as! ChannelsViewController
        XCTAssertNotNil(view.presenter)

        let presenter = view.presenter as! ChannelsPresenter
        XCTAssertNotNil(presenter.view)
        XCTAssertNotNil(presenter.interactor)
        XCTAssertNotNil(presenter.router)

        let interactor = presenter.interactor as! ChannelsInteractor
        XCTAssertNotNil(interactor.presenter)
    }

    func testNavigateToChannelSetsViewControllers() {
        let mockView = MockChannelsViewController()
        let navController = MockChannelsNavigationController(rootViewController: mockView)

        let router = ChannelsRouter()
        router.navigateToChannel(from: mockView, with: Channel(name: "Test"))

        XCTAssertTrue(navController.didSetViewControllers)
        XCTAssertEqual(navController.setViewControllersCalledWith?.count, 2)
        XCTAssertTrue(navController.setViewControllersCalledWith?.last is ChannelViewController)
    }

    func testNavigateToLogin_ReplacesRootWithLoginVC() {
        let window = UIWindow()
        let router = ChannelsRouter()
        let dummyView = UIViewController()
        router.viewController = dummyView
        
        let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = scene?.delegate as? SceneDelegate
        sceneDelegate?.window = window
        window.rootViewController = dummyView
        window.makeKeyAndVisible()

        router.navigateToLogin(with: "Bye")

        let exp = expectation(description: "Esperando transición de root y alerta")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            let root = sceneDelegate?.window?.rootViewController
            XCTAssertTrue(root is UINavigationController)
            
            let nav = root as! UINavigationController
            XCTAssertTrue(nav.viewControllers.first is LoginViewController)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 3.0)
    }
}
