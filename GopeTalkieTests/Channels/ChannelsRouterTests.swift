//
//  ChannelsRouterTests.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 25/07/25.
//

import XCTest
@testable import GopeTalkie

final class ChannelsRouterTests: XCTestCase {

    func testCreateModuleAssemblesAllDependencies() {
        let dummyChannel = Channel(name: "TestChannel")
        
        let viewController = ChannelsRouter.createModule(onChannelSelected: { selectedChannel in
            XCTAssertEqual(selectedChannel.name, dummyChannel.name)
        })

        XCTAssertTrue(viewController is ChannelsViewController)

        let view = viewController as! ChannelsViewController
        XCTAssertNotNil(view.presenter)

        let presenter = view.presenter as! ChannelsPresenter
        XCTAssertNotNil(presenter.view)
        XCTAssertNotNil(presenter.interactor)
        XCTAssertNotNil(presenter.router)
        XCTAssertNotNil(presenter.onChannelSelected)

        let interactor = presenter.interactor as! ChannelsInteractor
        XCTAssertNotNil(interactor.presenter)
    }
}
