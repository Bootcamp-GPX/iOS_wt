//
//  RegisterRequest.swift
//  GopeTalkie
//
//  Created by Gopenux on 16/07/25.
//

struct RegisterRequest: Codable {
    let first_name: String
    let last_name: String
    let email: String
    let password: String
    let confirm_password: String
}
