//
//  AppLanguagesFactory.swift
//  SwiftGenTest
//
//  Created by branderstudio on 5/18/19.
//  Copyright © 2019 branderstudio. All rights reserved.
//

import Foundation

class AppLanguagesFactory {
  
  // MARK: - Public
  
  class func createRussianLanguage() -> AppLanguage {
    return AppLanguage(
      iso639_1Code: ISO639_1Codes.russian,
      nativeName: Constants.NativeNames.russian)
  }
  
  class func createEnglishLanguage() -> AppLanguage {
    return AppLanguage(
      iso639_1Code: ISO639_1Codes.english,
      nativeName: Constants.NativeNames.english)
  }
  
  // MARK: - Constants
  
  struct ISO639_1Codes {
    static let russian = "ru"
    static let english = "en"
  }
  
  private struct Constants {
    
    struct NativeNames {
      static let russian = "Русский"
      static let english = "English"
    }
  }
}
