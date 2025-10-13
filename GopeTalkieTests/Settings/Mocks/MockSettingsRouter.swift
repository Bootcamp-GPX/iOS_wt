//
//  MockSettingsRouter.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 12/10/25.
//

import UIKit
@testable import GopeTalkie

final class MockSettingsRouter: SettingsRouterProtocol {
    var navigateToLoginCalled = false
    
    static func createModule() -> UIViewController {
        return UIViewController()
    }
    
    func navigateToLogin(from view: SettingsViewProtocol?) {
        navigateToLoginCalled = true
    }
}
