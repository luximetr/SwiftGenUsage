//
//  URLSession.swift
//  SwiftGenTest
//
//  Created by branderstudio on 5/17/19.
//  Copyright © 2019 branderstudio. All rights reserved.
//

import Foundation

protocol URLSessionProtocol {
  func createDataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol
}

extension URLSession: URLSessionProtocol {
  
  func createDataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
    return dataTask(with: request, completionHandler: completionHandler)
  }
}
