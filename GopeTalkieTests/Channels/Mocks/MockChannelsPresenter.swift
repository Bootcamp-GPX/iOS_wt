//
//  MockChannelsPresenter.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 25/07/25.
//

import XCTest
@testable import GopeTalkie

final class MockChannelsPresenter: ChannelsPresenterProtocol {
    var viewDidLoadCalled = false
    var selectedIndex: Int?
    var mockChannels: [Channel] = []

    func viewDidLoad() {
        viewDidLoadCalled = true
    }

    var channelsCount: Int {
        return mockChannels.count
    }

    func configure(cell: ChannelsTableViewCell, at index: Int) {
        cell.customLabel.text = mockChannels[index].name
    }

    func didSelectChannel(at index: Int) {
        selectedIndex = index
    }

    func didTapLogout() { }
}
