// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
internal enum L10n {
  internal enum Profile {
    /// Имя
    internal static let имя = L10n.tr("Profile", "Имя")
    /// Фамилия
    internal static let фамилия = L10n.tr("Profile", "Фамилия")
  }
  internal enum SignIn {
    /// Авторизация
    internal static let signIn = L10n.tr("SignIn", "SignIn")
  }
  internal enum SignUp {
    /// Регистрация
    internal static let signUp = L10n.tr("SignUp", "SignUp")
  }
  internal enum Start {
    /// Далее
    internal static let далее = L10n.tr("Start", "Далее")
    /// Демо
    internal static let демо = L10n.tr("Start", "Демо")
    /// (Максимум %d символов)
    internal static func максимумDСимволов(_ p1: Int) -> String {
      return L10n.tr("Start", "Максимум %d символов", p1)
    }
    /// Сменить язык
    internal static let сменитьЯзык = L10n.tr("Start", "Сменить язык")
    /// Цена - %@ грн.
    internal static func ценаГрн(_ p1: String) -> String {
      return L10n.tr("Start", "Цена - %@ грн.", p1)
    }
  }
  internal enum ViewController {
    /// Отмена
    internal static let cancel = L10n.tr("ViewController", "Cancel")
    /// Привет мир
    internal static let приветМир = L10n.tr("ViewController", "Привет мир")
    internal enum Button {
      /// Продолжить
      internal static let title = L10n.tr("ViewController", "button.title")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    // swiftlint:disable:next nslocalizedstring_key
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
