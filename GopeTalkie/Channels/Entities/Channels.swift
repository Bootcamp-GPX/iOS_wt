//
//  Channels.swift
//  GopeTalkie
//
//  Created by Gopenux on 17/07/25.
//

struct Channel: Codable {
    let name: String
    let isPrivate: Bool
    let maxUsers: Int
}
