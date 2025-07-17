//
//  WebSocketServiceProtocol.swift
//  GopeTalkie
//
//  Created by Gopenux on 17/07/25.
//

protocol WebSocketServiceProtocol {
    var delegate: WebSocketServiceDelegate? { get set }
    func connect(to channel: String)
    func send(message: String)
    func disconnect()
}
