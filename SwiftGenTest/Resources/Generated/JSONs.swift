// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - JSON Files

// swiftlint:disable identifier_name line_length type_body_length
internal enum JSONFiles {
  internal enum GetAuthorizationSuccess {
    private static let _document = JSONDocument(path: "GetAuthorizationSuccess.json")
    internal static let json: [String: Any] = _document.data
    internal static let authorizationToken: String = _document["authorization_token"]
    internal static let success: Bool = _document["success"]
  }
  internal enum LiterBalanceResponse {
    private static let _document = JSONDocument(path: "LiterBalanceResponse.json")
    internal static let json: [String: Any] = _document.data
    internal static let items: [[String: Any]] = _document["items"]
  }
  internal enum SocialNetworksResponse {
    private static let _document = JSONDocument(path: "SocialNetworksResponse.json")
    internal static let json: [String: Any] = _document.data
    internal static let networks: [[String: Any]] = _document["networks"]
    internal static let title: String = _document["title"]
  }
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

private func objectFromJSON<T>(at path: String) -> T {
  let bundle = Bundle(for: BundleToken.self)
  guard let url = bundle.url(forResource: path, withExtension: nil),
    let json = try? JSONSerialization.jsonObject(with: Data(contentsOf: url), options: []),
    let result = json as? T else {
    fatalError("Unable to load JSON at path: \(path)")
  }
  return result
}

private struct JSONDocument {
  let data: [String: Any]

  init(path: String) {
    self.data = objectFromJSON(at: path)
  }

  subscript<T>(key: String) -> T {
    guard let result = data[key] as? T else {
      fatalError("Property '\(key)' is not of type \(T.self)")
    }
    return result
  }
}

private final class BundleToken {}
