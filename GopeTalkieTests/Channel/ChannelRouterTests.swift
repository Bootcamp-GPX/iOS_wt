//
//  ChannelRouterTests.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 26/07/25.
//

import XCTest
@testable import GopeTalkie

final class ChannelRouterTests: XCTestCase {
    
    func testCreateModuleAssemblesAllDependencies() {
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

    func testNavigateToChannelsSetsViewControllers() {
        let mockView = MockChannelView()
        let mockNav = MockChannelNavigationController(rootViewController: mockView)

        let router = ChannelRouter()
        router.viewController = mockView

        router.navigateToChannels(from: mockView)

        XCTAssertTrue(mockNav.didSetViewControllers)
        XCTAssertEqual(mockNav.setViewControllersCalledWith?.count, 1)
        XCTAssertTrue(mockNav.setViewControllersCalledWith?.first is ChannelsViewController)
    }
}
