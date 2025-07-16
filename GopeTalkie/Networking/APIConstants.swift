//
//  APIConstants.swift
//  GopeTalkie
//
//  Created by Gopenux on 15/07/25.
//

import Foundation

enum APIConstants {
    static let baseURL = "http://159.203.187.94"
    
    enum Endpoint {
        static let register = "/register"
        static let login = "/login"
        static let logout = "/logout"
        static let user = "/channels"
    }
    
    struct Headers {
        static let contentType = "application/json"
    }
}
