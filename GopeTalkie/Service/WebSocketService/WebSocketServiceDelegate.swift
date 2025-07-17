//
//  WebSocketServiceDelegate.swift
//  GopeTalkie
//
//  Created by Gopenux on 17/07/25.
//

protocol WebSocketServiceDelegate: AnyObject {
    func didReceive(message: String)
}
