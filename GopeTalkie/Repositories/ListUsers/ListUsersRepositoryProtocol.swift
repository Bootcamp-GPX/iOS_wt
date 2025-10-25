//
//  ListUsersRepositoryProtocol.swift
//  GopeTalkie
//
//  Created by Gopenux on 12/10/25.
//

import Foundation

protocol ListUsersRepositoryProtocol {
    func fetchUsers(for channelName: String, completion: @escaping (Result<[String], Error>) -> Void)
}
