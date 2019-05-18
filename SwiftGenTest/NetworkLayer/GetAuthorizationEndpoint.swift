//
//  GetAuthorizationEndpoint.swift
//  SwiftGenTest
//
//  Created by branderstudio on 5/17/19.
//  Copyright © 2019 branderstudio. All rights reserved.
//

import Foundation

class GetAuthorizationEndpoint: Endpoint {
  
  let endpoint = "/api/truncated/login"
  
  private func prepareRequest(deviceId: String) -> URLRequest {
    let url = URL(string: "https://beta.jitplus.com.ua" + endpoint)!
    let HTTPMethod = "POST"
    var headers: [String: String] = [:]
    headers["Content-Type"] = "application/json"
    var JSON: [String: Any] = [:]
    JSON["device_id"] = deviceId
    let HTTPBody = try! JSONSerialization.data(withJSONObject: JSON)
    var request = URLRequest(url: url)
    request.httpMethod = HTTPMethod
    request.allHTTPHeaderFields = headers
    request.httpBody = HTTPBody
    return request
  }
  
  func make(deviceId: String, onComplete completion: @escaping (String?, Error?) -> Void) {
    let request = prepareRequest(deviceId: deviceId)
    
    let task = session.createDataTask(with: request) { [weak self] data, response, error in
      guard let strongSelf = self else { return }
      guard let data = data, error == nil,
        let JSON = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [String: Any] else {
          DispatchQueue.main.async { completion(nil, nil) }
          return
      }
      if let error = strongSelf.parseError(JSON) {
        DispatchQueue.main.async { completion(nil, error) }
      } else if let authorizationToken = strongSelf.parseSuccess(JSON) {
        DispatchQueue.main.async { completion(authorizationToken, nil) }
      } else {
        DispatchQueue.main.async { completion(nil, nil) }
      }
    }
    task.resume()
  }
  
  private func parseError(_ JSON: [String: Any]) -> Error? {
    guard let errorJSON = JSON["error"] as? [String: Any] else { return nil }
    return NSError(domain: "asdasd", code: 123, userInfo: errorJSON)
  }
  
  private func parseSuccess(_ JSON: [String: Any]) -> String? {
    guard let success = JSON["success"] as? Bool, success == true else { return nil }
    guard let authorizationToken = JSON["authorization_token"] as? String else { return nil }
    return authorizationToken
  }
  
}
