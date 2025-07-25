//
//  MockChannelsViewController.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 25/07/25.
//

import UIKit
@testable import GopeTalkie

final class MockChannelsViewController: UIViewController, ChannelsViewProtocol {
    var reloadDataCalled = false
    var showErrorMessage: String?

    func reloadData() {
        reloadDataCalled = true
    }

    func showError(message: String) {
        showErrorMessage = message
    }
}
