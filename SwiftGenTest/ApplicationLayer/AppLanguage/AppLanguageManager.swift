//
//  AppLanguageManager.swift
//  SwiftGenTest
//
//  Created by branderstudio on 5/18/19.
//  Copyright © 2019 branderstudio. All rights reserved.
//

import Foundation

final class AppLanguageManager {
  
  // MARK: - Private variables
  
  private let defaultLanguage: AppLanguage
  private var currentLanguage: AppLanguage
  
  // MARK: - Public variables
  
  let languages: [AppLanguage]
  
  // MARK: - Life cycle
  
  init() {
    let russian = AppLanguagesFactory.createRussianLanguage()
    let english = AppLanguagesFactory.createEnglishLanguage()
    defaultLanguage = russian
    currentLanguage = defaultLanguage
    languages = [russian, english]
  }
  
  // MARK: - Public
  
  func setup() {
    currentLanguage = fetchCurrentLanguage() ?? defaultLanguage
  }
  
  func setCurrentLanguage(_ language: AppLanguage) {
    currentLanguage = language
    NotificationCenter.default.post(name: .appLanguageChanged, object: language)
    saveCurrentLanguage(language)
  }
  
  func getCurrentLanguage() -> AppLanguage {
    return currentLanguage
  }
  
  // MARK: - Private
  
  private func fetchCurrentLanguage() -> AppLanguage? {
    guard let fetchedISOCode = fetchCurrentLanguageISOCode() else { return nil }
    return languages.first { $0.iso639_1Code == fetchedISOCode }
  }
  
  private func fetchCurrentLanguageISOCode() -> String? {
    if let fetchedISOCode = UserDefaults.standard.value(forKey: Constants.currentLanguageISOKey) as? String {
      return fetchedISOCode
    } else if let deviceLanguageISOCode = getDeviceLanguageISOCode() {
      return deviceLanguageISOCode
    } else {
      return nil
    }
  }
  
  private func getDeviceLanguageISOCode() -> String? {
    guard let firstLanguageName = Locale.preferredLanguages.first else { return nil }
    guard let prefix = firstLanguageName.split(separator: "-").first else { return nil }
    return String(prefix)
  }
  
  private func saveCurrentLanguage(_ language: AppLanguage) {
    UserDefaults.standard.set(language.iso639_1Code, forKey: Constants.currentLanguageISOKey)
  }
  
  // MARK: - Constants
  
  private struct Constants {
    static let currentLanguageISOKey = "currentLanguageISOKey"
  }
}

extension Notification.Name {
  static let appLanguageChanged = Notification.Name("appLanguageChanged")
}
