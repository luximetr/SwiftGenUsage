//
//  GetAuthorizationEndpointTests.swift
//  SwiftGenTestTests

import XCTest
@testable import SwiftGenTest

private class MockURLSession: URLSessionProtocol {
  
  func createDataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
    let jsonDict = JSONFiles.GetAuthorizationSuccess.json
    let data = try? JSONSerialization.data(withJSONObject: jsonDict, options: [])
    completionHandler(data, nil, nil)
    return MockURLSessionDataTask()
  }
  
}

class GetAuthorizationEndpointTests: XCTestCase {
  
  var endpoint: GetAuthorizationEndpoint!
  
  override func setUp() {
    super.setUp()
    endpoint = GetAuthorizationEndpoint(session: MockURLSession())
  }
  
  func testSuccess() {
    let exp = expectation(description: "\(#function)\(#line)")
    endpoint.make(deviceId: "asdasd", onComplete: { token, error in
      XCTAssertTrue(token == "12345")
      
      exp.fulfill()
    })
    
    waitForExpectations(timeout: 2, handler: nil)
  }
  
  func testFailure() {
    let exp = expectation(description: "\(#function)\(#line)")
    endpoint.make(deviceId: "asdasd", onComplete: { token, error in
      XCTAssertTrue(token != "aaaa")
      
      exp.fulfill()
    })
    
    waitForExpectations(timeout: 2, handler: nil)
  }
}
