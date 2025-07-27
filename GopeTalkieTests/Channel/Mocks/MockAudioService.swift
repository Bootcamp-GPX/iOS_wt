//
//  MockAudioService.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 26/07/25.
//

import XCTest
@testable import GopeTalkie

final class MockAudioService: AudioServiceProtocol {
    var startStreamingCalled = false
    var stopStreamingCalled = false
    
    func startStreaming(to socket: WebSocketServiceProtocol) {
        startStreamingCalled = true
    }
    
    func stopStreaming() {
        stopStreamingCalled = true
    }
    
    func playAudioData(_ data: Data) {}
}
