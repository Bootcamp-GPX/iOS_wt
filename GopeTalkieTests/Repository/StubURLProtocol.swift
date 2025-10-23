//
//  StubURLProtocol.swift
//  GopeTalkieTests
//
//  Created by Gopenux on 23/07/25.
//

import Foundation

class StubURLProtocol: URLProtocol {
    static var stubResponseData: Data?
    static var stubError: Error?
    static var stubResponse: URLResponse?

    override class func canInit(with request: URLRequest) -> Bool { true }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest { request }

    override func startLoading() {
        if let error = StubURLProtocol.stubError {
            self.client?.urlProtocol(self, didFailWithError: error)
        } else {
            if let response = StubURLProtocol.stubResponse {
                self.client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            }
            
            if let data = StubURLProtocol.stubResponseData {
                self.client?.urlProtocol(self, didLoad: data)
            }
        }

        self.client?.urlProtocolDidFinishLoading(self)
    }

    override func stopLoading() {}
}
