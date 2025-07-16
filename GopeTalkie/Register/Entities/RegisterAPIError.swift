//
//  RegisterAPIError.swift
//  GopeTalkie
//
//  Created by Gopenux on 16/07/25.
//

struct RegisterAPIError: Codable {
    let code: Int
    let type: String
    let message: String
}
