//
//  MockSettingsInteractor.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 12/10/25.
//

import Foundation
@testable import GopeTalkie

final class MockSettingsInteractor: SettingsInteractorInputProtocol {
    var presenter: SettingsInteractorOutputProtocol?
    var performLogoutCalled = false
    
    func performLogout() {
        performLogoutCalled = true
    }
}
