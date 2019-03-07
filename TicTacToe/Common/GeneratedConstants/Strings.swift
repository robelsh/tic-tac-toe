// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable function_parameter_count identifier_name line_length type_body_length
internal enum L10n {
  /// Match nul
  internal static let mainGameStateDraw = L10n.tr("Localizable", "main.game.state.draw")
  /// Joueur %@ à gagner !
  internal static func mainGameStateWin(_ p1: String) -> String {
    return L10n.tr("Localizable", "main.game.state.win", p1)
  }
  /// Au tour du joueur %d
  internal static func mainLblCurrentPlayer(_ p1: Int) -> String {
    return L10n.tr("Localizable", "main.lbl.current.player", p1)
  }
}
// swiftlint:enable function_parameter_count identifier_name line_length type_body_length

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    // swiftlint:disable:next nslocalizedstring_key
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
