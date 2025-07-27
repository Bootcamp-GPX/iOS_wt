//
//  MockChannelView.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 26/07/25.
//

import XCTest
@testable import GopeTalkie

final class MockChannelView: UIViewController, ChannelViewProtocol {
    var presenter: ChannelPresenterProtocol?
    var channelName: String?
    var usersShown: [String]?

    func setChannelName(_ name: String) {
        channelName = name
    }

    func displayUsers(_ emails: [String]) {
        usersShown = emails
    }
}
