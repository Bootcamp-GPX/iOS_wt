//
//  ChannelsRepositoryTests.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 25/07/25.
//

import XCTest
@testable import GopeTalkie

final class ChannelsRepositoryTests: XCTestCase {
    var repository: ChannelsRepository!
    var session: URLSession!

    override func setUp() {
        super.setUp()

        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        session = URLSession(configuration: config)
        repository = ChannelsRepository(session: session)
    }

    func testFetchChannelsSuccessResponse() {
        let mockChannelNames = ["Channel 1", "Channel 2", "Channel 3"]
        let responseData = try! JSONEncoder().encode(mockChannelNames)

        MockURLProtocol.mockResponseData = responseData
        MockURLProtocol.mockError = nil

        let expectation = self.expectation(description: "fetchChannels completes")

        repository.fetchChannels { result in
            switch result {
            case .success(let channels):
                XCTAssertEqual(channels.count, 3)
                XCTAssertEqual(channels[0].name, "Channel 1")
            case .failure:
                XCTFail("Expected success, got failure")
            }
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1)
    }

    func testFetchChannelsReturnsInvalidJSONError() {
        let invalidJSON = ["invalid": "data"]
        let responseData = try! JSONEncoder().encode(invalidJSON)

        MockURLProtocol.mockResponseData = responseData
        MockURLProtocol.mockError = nil

        let expectation = self.expectation(description: "fetchChannels completes")

        repository.fetchChannels { result in
            switch result {
            case .success:
                XCTFail("Expected failure, got success")
            case .failure(let error):
                XCTAssertEqual((error as NSError).domain, "InvalidJSON")
            }
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1)
    }

    func testFetchChannelsHandlesNetworkError() {
        let networkError = NSError(domain: "Network", code: -1009, userInfo: [NSLocalizedDescriptionKey: "Sin conexión"])

        MockURLProtocol.mockError = networkError
        MockURLProtocol.mockResponseData = nil

        let expectation = self.expectation(description: "fetchChannels completes")

        repository.fetchChannels { result in
            switch result {
            case .success:
                XCTFail("Expected failure, got success")
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription, "Sin conexión")
            }
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1)
    }
}
