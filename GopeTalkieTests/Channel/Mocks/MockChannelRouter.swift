//
//  MockChannelRouter.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 26/07/25.
//

import XCTest
@testable import GopeTalkie

final class MockChannelRouter: ChannelRouterProtocol {
    var navigateToListUsersCalled = false
    var listUsersChannelName: String?

    func navigateToListUsers(from view: any GopeTalkie.ChannelViewProtocol, with channelName: String) {
        navigateToListUsersCalled = true
        listUsersChannelName = channelName
    }
    
    var presentModalCalled = false
    var navigateToSettingsCalled = false
    var navigateToChannelPrivateCreateCalled = false

    static func createModule(with channel: GopeTalkie.Channel?) -> UIViewController {
        return UIViewController()
    }
        
    func presentChannelsModally(from view: ChannelViewProtocol) {
        presentModalCalled = true
    }

    func navigateToChannelPrivateCreate(from view: ChannelViewProtocol) {
        navigateToChannelPrivateCreateCalled = true
    }
    
    func navigateToSettings(from view: ChannelViewProtocol) {
        navigateToSettingsCalled = true
    }
}
