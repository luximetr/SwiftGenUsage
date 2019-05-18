// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSColor
  internal typealias Color = NSColor
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIColor
  internal typealias Color = UIColor
#endif

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Colors

// swiftlint:disable identifier_name line_length type_body_length
internal struct ColorName {
  internal let rgbaValue: UInt32
  internal var color: Color { return Color(named: self) }

  internal enum ColorsCLR {
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#a07898"></span>
    /// Alpha: 100% <br/> (0xa07898ff)
    internal static let bouquet = ColorName(rgbaValue: 0xa07898ff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#a38f79"></span>
    /// Alpha: 100% <br/> (0xa38f79ff)
    internal static let donkeyBrown = ColorName(rgbaValue: 0xa38f79ff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#98a77b"></span>
    /// Alpha: 100% <br/> (0x98a77bff)
    internal static let greenSmoke = ColorName(rgbaValue: 0x98a77bff)
  }
  internal enum ColorsJSON {
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#aaeea0"></span>
    /// Alpha: 100% <br/> (0xaaeea0ff)
    internal static let madang = ColorName(rgbaValue: 0xaaeea0ff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#a0bdee"></span>
    /// Alpha: 100% <br/> (0xa0bdeeff)
    internal static let perano = ColorName(rgbaValue: 0xa0bdeeff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#eed8a0"></span>
    /// Alpha: 100% <br/> (0xeed8a0ff)
    internal static let chalky = ColorName(rgbaValue: 0xeed8a0ff)
  }
  internal enum ColorsTXT {
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#339666"></span>
    /// Alpha: 100% <br/> (0x339666ff)
    internal static let articleBody = ColorName(rgbaValue: 0x339666ff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ff66cc"></span>
    /// Alpha: 100% <br/> (0xff66ccff)
    internal static let articleFootnote = ColorName(rgbaValue: 0xff66ccff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#33fe66"></span>
    /// Alpha: 100% <br/> (0x33fe66ff)
    internal static let articleTitle = ColorName(rgbaValue: 0x33fe66ff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ff66cc"></span>
    /// Alpha: 100% <br/> (0xff66ccff)
    internal static let cyanColor = ColorName(rgbaValue: 0xff66ccff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ffffff"></span>
    /// Alpha: 80% <br/> (0xffffffcc)
    internal static let namedValue = ColorName(rgbaValue: 0xffffffcc)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ffffff"></span>
    /// Alpha: 80% <br/> (0xffffffcc)
    internal static let nestedNamedValue = ColorName(rgbaValue: 0xffffffcc)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ffffff"></span>
    /// Alpha: 80% <br/> (0xffffffcc)
    internal static let `private` = ColorName(rgbaValue: 0xffffffcc)
  }
  internal enum ColorsXML {
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#eea0cf"></span>
    /// Alpha: 100% <br/> (0xeea0cfff)
    internal static let kobi = ColorName(rgbaValue: 0xeea0cfff)
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#f1ede5"></span>
    /// Alpha: 100% <br/> (0xf1ede5ff)
    internal static let springWood = ColorName(rgbaValue: 0xf1ede5ff)
  }
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

// swiftlint:disable operator_usage_whitespace
internal extension Color {
  convenience init(rgbaValue: UInt32) {
    let red   = CGFloat((rgbaValue >> 24) & 0xff) / 255.0
    let green = CGFloat((rgbaValue >> 16) & 0xff) / 255.0
    let blue  = CGFloat((rgbaValue >>  8) & 0xff) / 255.0
    let alpha = CGFloat((rgbaValue      ) & 0xff) / 255.0

    self.init(red: red, green: green, blue: blue, alpha: alpha)
  }
}
// swiftlint:enable operator_usage_whitespace

internal extension Color {
  convenience init(named color: ColorName) {
    self.init(rgbaValue: color.rgbaValue)
  }
}
