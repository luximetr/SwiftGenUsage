//
//  Localizator.swift
//  SwiftGenTest
//
//  Created by branderstudio on 5/18/19.
//  Copyright © 2019 branderstudio. All rights reserved.
//

import UIKit

class Localizator {
  
  // MARK: - Private variables
  
  private let stringsFileName: String?
  private let stringsDictFileName: String?
  private let appLanguageStorage: AppLanguageStorage
  
  // MARK: - Life cycle
  
  init(stringsFileName: String? = nil,
       stringsDictFileName: String? = nil,
       appLanguageStorage: AppLanguageStorage = AppSettings.shared) {
    self.appLanguageStorage = appLanguageStorage
    self.stringsFileName = stringsFileName
    self.stringsDictFileName = stringsDictFileName
  }
  
  // MARK: - Public
  
  func localizedString(_ string: String, _ args: CVarArg...) -> String {
    let bundle = getBundle()
    let defaultString = "*\(string)"
    
    let stringsLocalizedString = searchInStrings(
      translateString: string, defaultString: defaultString, bundle: bundle)
    
    let stringsFound = stringsLocalizedString != defaultString
    if stringsFound {
      return String(format: stringsLocalizedString, arguments: args)
    }
    
    let stringsDictLocalizedString = searchInStringsDict(
      translateString: string, defaultString: defaultString, bundle: bundle)
    return String(format: stringsDictLocalizedString, arguments: args)
  }
  
  // MARK: - Searching in localization files
  
  private func searchInStrings(translateString: String, defaultString: String, bundle: Bundle) -> String {
    return NSLocalizedString(translateString,
                             tableName: stringsFileName,
                             bundle: bundle,
                             value: defaultString,
                             comment: "")
  }
  
  private func searchInStringsDict(translateString: String, defaultString: String, bundle: Bundle) -> String {
    return NSLocalizedString(translateString,
                             tableName: stringsDictFileName ?? stringsFileName,
                             bundle: bundle,
                             value: defaultString,
                             comment: "")
  }
  
  // MARK: - Bundle finding
  
  private func getBundle() -> Bundle {
    let defaultBundle = Bundle.main
    let languageCode = appLanguageStorage.currentAppLanguage.iso639_1Code
    guard let bundlePath = Bundle.main.path(forResource: languageCode, ofType: "lproj") else {
      return defaultBundle
    }
    return Bundle(path: bundlePath) ?? Bundle.main
  }
}

