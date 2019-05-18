//
//  AppSettings.swift
//  SwiftGenTest
//
//  Created by branderstudio on 5/18/19.
//  Copyright © 2019 branderstudio. All rights reserved.
//

import Foundation

protocol AppLanguageStorage {
  var currentAppLanguage: AppLanguage { get }
  var availableLanguages: [AppLanguage] { get }
  func setAppLanguage(_ language: AppLanguage)
}

class AppSettings:AppLanguageStorage {
  
  // MARK: - Private variables
  
  private let appLanguageManager = AppLanguageManager()
  
  // MARK: - Public
  
  static let shared = AppSettings()
  
  // MARK: - Life cycle
  
  init() {
    appLanguageManager.setup()
  }
  
  // MARK: - AppLanguageStorage
  
  func setAppLanguage(_ language: AppLanguage) {
    appLanguageManager.setCurrentLanguage(language)
  }
  
  var currentAppLanguage: AppLanguage {
    return appLanguageManager.getCurrentLanguage()
  }
  
  var availableLanguages: [AppLanguage] {
    return appLanguageManager.languages
  }
}

// MARK: - Constants

private struct Constants {
  static let tutorialWasShownKey = "tutorialWasShownKey"
  static let consultationTutorialWasShownKey = "consultationTutorialWasShownKey"
}
