//
//  MockSettingsPresenter.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 12/10/25.
//

import Foundation
@testable import GopeTalkie

final class MockSettingsPresenter: SettingsInteractorOutputProtocol {
    var didLogoutSuccessfullyCalled = false
    
    func didLogoutSuccessfully() {
        didLogoutSuccessfullyCalled = true
    }
}
