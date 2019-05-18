//
//  Endpoint.swift
//  SwiftGenTest
//
//  Created by branderstudio on 5/17/19.
//  Copyright © 2019 branderstudio. All rights reserved.
//

import Foundation

class Endpoint {
  
  let session: URLSessionProtocol
  
  init(session: URLSessionProtocol = URLSession.shared) {
    self.session = session
  }
}
