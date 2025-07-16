//
//  TokenExpirationHandler.swift
//  GopeTalkie
//
//  Created by Gopenux on 15/07/25.
//

import Foundation

enum TokenExpirationHandler {
    static func handleIfNeeded(_ response: URLResponse?) -> Bool {
        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 401 {
            print("Token expirado detectado")
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: .tokenExpired, object: nil)
            }
            return true
        }
        return false
    }
}
