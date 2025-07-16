//
//  HomeProtocols.swift
//  GopeTalkie
//
//  Created by Gopenux on 16/07/25.
//

import Foundation

protocol HomeViewProtocol: AnyObject {
    func showLogoutError(_ message: String)
}

protocol HomePresenterProtocol: AnyObject {
    func didTapLogout()
}

protocol HomeInteractorProtocol: AnyObject {
    func logout()
}

protocol HomeInteractorOutputProtocol: AnyObject {
    func logoutSucceeded(message: String)
    func logoutFailed(with error: Error)
}

protocol HomeRouterProtocol: AnyObject {
    func navigateToLogin(with message: String)
}
