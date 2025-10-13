//
//  ChannelsEntitiesTests.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 26/08/25.
//

import XCTest
@testable import GopeTalkie

final class ChannelsEntitiesTests: XCTestCase {
    
    func testChannelsInitialization() {
        let name = "canal 1"
        let isPrivate: Bool = false
        let maxUsers: Int = 100
        
        let channel = Channel(name: name, isPrivate: isPrivate, maxUsers: maxUsers)
        
        XCTAssertEqual(channel.name, name)
        XCTAssertEqual(channel.isPrivate, isPrivate)
        XCTAssertEqual(channel.maxUsers, maxUsers)

    }
}
