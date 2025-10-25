//
//  ChannelPrivateJoinResponse.swift
//  GopeTalkie
//
//  Created by Gopenux on 11/10/25.
//

import Foundation

struct ChannelPrivateJoinResponse: Codable {
    let id: Int
    let isPrivate: Bool
    let maxUsers: Int
    let message: String
    let name: String
}
