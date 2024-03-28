//
//  ThemeManager.swift
//  myCar
//
//  Created by Petar Sakotic on 3/28/24.
//

import SwiftUI

/// Core ThemeManager class for handling theme colors and fonts
final class ThemeManager: ObservableObject {
    
    @Published private(set) var colorPalette: ColorPalette
    @Published private(set) var font: DynamicFont
    
    init() {
        self.colorPalette = MyCarColorPalette()
        self.font = Monstesrrat()
    }
    
    var errorColor: Color { colorPalette.color(for: .error) }
    var gradientBlueColor: Color { colorPalette.color(for: .gradientBlue) }
    var gradientPurpleColor: Color { colorPalette.color(for: .gradientPurple) }
    var gradientMainOrangeColor: Color { colorPalette.color(for: .gradientOrange) }
    var gradientYellowColor: Color { colorPalette.color(for: .gradientYellow) }
    var mainBlackColor: Color { colorPalette.color(for: .black) }
    var mainRedColor: Color { colorPalette.color(for: .red) }
    var mainYellowColor: Color { colorPalette.color(for: .yellow) }
    var solidBlueColor: Color { colorPalette.color(for: .solidBlue) }
    var solidGreyColor: Color { colorPalette.color(for: .solidGray) }
    var solidYellowColor: Color { colorPalette.color(for: .solidYellow) }
    var successColor: Color { colorPalette.color(for: .success) }
    var warningColor: Color { colorPalette.color(for: .warning) }
    
}

//MARK: - ColorPalette

/// List of all colors in Application
enum ThemeColorIdentifier {

    case error
    case gradientBlue
    case gradientPurple
    case gradientOrange
    case gradientYellow
    case black
    case red
    case yellow
    case solidBlue
    case solidGray
    case solidYellow
    case success
    case warning
    
    case rawValue(Color)
}

protocol ColorPalette {
    func color(for themeColor: ThemeColorIdentifier) -> Color
}

struct MyCarColorPalette: ColorPalette {
    
    /// Function will return specific color assosieted with specific theme color identifier
    /// - Parameter : themeColor value that represents specific color identifier
    /// - Returns:Color value
    func color(for themeColor: ThemeColorIdentifier) -> Color {
        let uiColor: UIColor
        switch themeColor {
        case .error: uiColor          = #colorLiteral(red: 0.8365648389, green: 0.247738272, blue: 0.3491867781, alpha: 1)
        case .gradientBlue: uiColor   = #colorLiteral(red: 0.7407047153, green: 0.8861387372, blue: 0.9293252826, alpha: 1)
        case .gradientPurple: uiColor = #colorLiteral(red: 0.7301176786, green: 0.5802459121, blue: 0.7253614068, alpha: 1)
        case .gradientOrange: uiColor = #colorLiteral(red: 0.8755064607, green: 0.4787967801, blue: 0.4629380703, alpha: 1)
        case .gradientYellow: uiColor = #colorLiteral(red: 0.9997209907, green: 0.9689419866, blue: 0.721973896, alpha: 1)
        case .black: uiColor          = #colorLiteral(red: 0.04667016119, green: 0.1489100456, blue: 0.1920937598, alpha: 1)
        case .red: uiColor            = #colorLiteral(red: 0.8365648389, green: 0.247738272, blue: 0.3491867781, alpha: 1)
        case .yellow: uiColor         = #colorLiteral(red: 0.9258452058, green: 0.6985373497, blue: 0.3577545881, alpha: 1)
        case .solidBlue: uiColor      = #colorLiteral(red: 0.8703282475, green: 0.9489557147, blue: 0.9646665454, alpha: 1)
        case .solidGray: uiColor      = #colorLiteral(red: 0.9529398084, green: 0.9490330815, blue: 0.9411877394, alpha: 1)
        case .solidYellow: uiColor    = #colorLiteral(red: 0.9997002482, green: 0.9728654027, blue: 0.7219797969, alpha: 1)
        case .success: uiColor        = #colorLiteral(red: 0.6536450386, green: 0.796397984, blue: 0.4124969244, alpha: 1)
        case .warning: uiColor        = #colorLiteral(red: 0.9297786355, green: 0.6985405087, blue: 0.3577581048, alpha: 1)
            
        case .rawValue(let color): return color
        }
        
        return Color(uiColor: uiColor)
    }
}

//MARK: - ThemeFont

/// List of all fonts in Application
enum ThemeFontIdentifier {
    case black
    case blackitalic
    case bold
    case bolditalic
    case extrabold
    case extraboldItalic
    case italic
    case light
    case lightitalic
    case medium
    case mediumitalic
    case regular
    case semibold
    case semibolditalic
    case thin
    case thinitalic
    
}

protocol DynamicFont {
    func fontName(for themeFontName: ThemeFontIdentifier) -> String
    func fontSize(style: UIFont.TextStyle) -> CGFloat
}

struct Monstesrrat: DynamicFont {
    
    /// Function will return specific font assosieted with specific theme font identifier
    /// - Parameter : themeFontIdentifier value that represents specific font identifier
    /// - Returns:Name of the specific font
    func fontName(for themeFontName: ThemeFontIdentifier) -> String {
        switch themeFontName {
        case .black: return "Montserrat-Black"
        case .blackitalic: return "Montserrat-BlackItalic"
        case .bold: return "Montserrat-Bold"
        case .bolditalic: return "Montserrat-BoldItalic"
        case .extrabold: return "Montserrat-ExtraBold"
        case .extraboldItalic: return "Montserrat-ExtraBoldItalic"
        case .italic: return "Montserrat-Italic"
        case .light: return "Montserrat-Light"
        case .lightitalic: return "Montserrat-LightItalic"
        case .medium: return "Montserrat-Medium"
        case .mediumitalic: return "Montserrat-MediumItalic"
        case .regular: return "Montserrat-Regular"
        case .semibold: return "Montserrat-SemiBold"
        case .semibolditalic: return "Montserrat-SemiBoldItalic"
        case .thin: return "Montserrat-Thin"
        case .thinitalic: return "Montserrat-ThinItalic"
        }
    }
    
    /// Function will return size of the font strings
    /// - Parameter : style value that represents specific size identifier
    /// - Returns:Size value of the specific font
    func fontSize(style: UIFont.TextStyle) -> CGFloat {
        switch style {
        case .largeTitle: return 34.0
        case .title1: return 28.0
        case .title2: return 22.0
        case .title3: return 20.0
        case .headline: return 18.0
        case .body: return 17.0
        case .callout: return 16.0
        case .subheadline: return 15.0
        case .footnote: return 13.0
        case .caption1: return 12.0
        case .caption2: return 11.0
        default: return 17.0
        }
    }
}

/// ViewModifier will scale up our font size based on the current accessibility setting, and also detect when that setting changes.
struct ScaledFont: ViewModifier {
    @EnvironmentObject var themeManager: ThemeManager
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    var themeFontName: ThemeFontIdentifier
    var size: UIFont.TextStyle
    var overrideFontSize: DynamicTypeSize?
    
    func body(content: Content) -> some View {
        let name = themeManager.font.fontName(for: themeFontName)
        let size = themeManager.font.fontSize(style: size)
        let scaledSize = UIFontMetrics.default.scaledValue(for: size, compatibleWith: UITraitCollection(
            preferredContentSizeCategory: UIContentSizeCategory(overrideFontSize)
        ))
        
        return content.font(.custom(name, size: scaledSize))
    }
}
/// ViewModifier will set up color for our content, with opacity that we will set
struct ThemeForegroundStyleModifier: ViewModifier {
    @EnvironmentObject var themeManager: ThemeManager
    let themeColor: ThemeColorIdentifier
    let opacity: Double
    
    func body(content: Content) -> some View {
        let color = themeManager.colorPalette.color(for: themeColor).opacity(opacity)
        return content.foregroundStyle(color)
    }
    
}

extension View {
    func themedFont(_ themeFontName: ThemeFontIdentifier, style: UIFont.TextStyle, overrideFontSize: DynamicTypeSize? = nil) -> some View {
        return modifier(ScaledFont(themeFontName: themeFontName, size: style, overrideFontSize: overrideFontSize))
    }
    
    func themeForegroundStyle(_ themeColor: ThemeColorIdentifier, opacity: Double = 1) -> some View {
        return modifier(ThemeForegroundStyleModifier(themeColor: themeColor, opacity: opacity))
    }
}
