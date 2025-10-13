//
//  SettingsInteractor.swift
//  GopeTalkie
//
//  Created by Gopenux on 12/10/25.
//

import Foundation

class SettingsInteractor: SettingsInteractorInputProtocol {
    weak var presenter: SettingsInteractorOutputProtocol?

    func performLogout() {
        TokenManager.clear()
        presenter?.didLogoutSuccessfully()
    }
}
