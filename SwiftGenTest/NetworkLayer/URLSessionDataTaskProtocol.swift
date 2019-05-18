//
//  URLSessionDataTaskProtocol.swift
//  SwiftGenTest
//
//  Created by branderstudio on 5/17/19.
//  Copyright © 2019 branderstudio. All rights reserved.
//

import Foundation

protocol URLSessionDataTaskProtocol {
  func resume()
}

extension URLSessionDataTask: URLSessionDataTaskProtocol {}
