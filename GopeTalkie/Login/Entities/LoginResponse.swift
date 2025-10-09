//
//  LoginResponse.swift
//  GopeTalkie
//
//  Created by Gopenux on 15/07/25.
//

struct LoginResponse: Codable {
    let accessToken: String
    let accessTokenExpiresIn: Int
    let email: String
    let first_name: String
    let last_name: String
    let refreshToken: String
    let refreshTokenExpiresAt: String
    let user_id: Int
}
