
//
//  ChannelPrivateCreateResponse.swift
//  GopeTalkie
//
//  Created by Gopenux on 10/10/25.
//

import Foundation

struct ChannelPrivateCreateResponse: Codable {
    let id: Int
    let isPrivate: Bool
    let maxUsers: Int
    let message: String
    let name: String
}
