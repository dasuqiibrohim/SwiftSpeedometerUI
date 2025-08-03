//
//  FontStyle.swift
//  SwiftSpeedometerUI
//
//  Created by Ibrohim Dasuqi on 03/08/25.
//

import SwiftUI

private enum FontType: String {
    case montserrat
    case josefinSans
    case poppins
    case openSans
    case sourceSansPro
    case nunito
    case inter
    case sora
    case gilroy
    case robotoCondensed
    
    var name: String {
        self.rawValue.capitalized
    }
}
private enum FontWeight: String {
    case extraLight
    case light
    case thin
    case regular
    case medium
    case semiBold
    case bold
    case extraBold
    case black
    
    case extraLightItalic
    case lightItalic
    case thinItalic
    case regularItalic
    case mediumItalic
    case semiBoldItalic
    case boldItalic
    case extraBoldItalic
    case blackItalic
    
    var name: String {
        "-" + self.rawValue.capitalized
    }
}

// Custom Font Methods
@available(iOS 14, *)
extension Font {
    /// Use this method for custom fonts with variable weight and style.
    /// Dynamically updates the font size with the system size.
    /// - Parameters:
    ///   - type: Cases that describe the preferred type of font.
    ///   - weight: Cases that describe the preferred weight for fonts.
    ///   - style: Constants that describe the preferred styles for fonts.
    /// - Returns: Custom font based on the parameters you specified.
    static private func font(type: FontType, weight: FontWeight, style: UIFont.TextStyle) -> Font {
        .custom(type.name + weight.name, size: UIFont.preferredFont(forTextStyle: style).pointSize)
    }
    
    /// Use this method for custom fonts with variable weight and size.
    /// Dynamically updates the font size with the system size.
    /// - Parameters:
    ///   - type: Cases that describe the preferred type of font.
    ///   - weight: Cases that describe the preferred weight for fonts.
    ///   - size: Constants that describe the preferred size for fonts.
    /// - Returns: Custom font based on the parameters you specified.
    static private func font(type: FontType, weight: FontWeight, size: CGFloat) -> Font {
        .custom(type.name + weight.name, size: size)
    }
}

// Custom Fonts Naming
@available(iOS 14.0, *)
extension Font {
    // Bold Headline
    static let headline1 = font(type: .robotoCondensed, weight: .bold, size: 24)
    static let headline6 = font(type: .robotoCondensed, weight: .bold, size: 16)

}
