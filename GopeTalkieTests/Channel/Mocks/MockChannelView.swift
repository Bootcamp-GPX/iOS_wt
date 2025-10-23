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
    var usersShown: String?
    var showDisconnectedStateCalled = false
    var promptForPINCalled = false
    var pinCompletion: ((String?) -> Void)?

    func setChannelName(_ name: String) {
        channelName = name
    }
    
    func displayUsers(_ text: String) {
        usersShown = text
    }
    
    func showDisconnectedState() {
        showDisconnectedStateCalled = true
    }
    
    func promptForPIN(completion: @escaping (String?) -> Void) {
        promptForPINCalled = true
        pinCompletion = completion
    }
    
    func simulatePinEntry(_ pin: String?) {
        pinCompletion?(pin)
    }
}
