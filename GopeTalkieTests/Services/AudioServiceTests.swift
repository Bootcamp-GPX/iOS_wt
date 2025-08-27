//
//  AudioServiceTests.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 27/08/25.
//

import XCTest
@testable import GopeTalkie

final class AudioServiceTests: XCTestCase {
    var audioService: AudioService!
    
    override func setUp() {
        super.setUp()
        audioService = AudioService()
    }

    func testPlayAudioDataShouldNotFailWithValidData() {
        let samples: [Int16] = [Int16.max, Int16.min, 0]
        let data = samples.withUnsafeBufferPointer { buffer in
            Data(buffer: buffer)
        }
        
        XCTAssertNoThrow(audioService.playAudioData(data))
    }
}
