//
//  FontLoader.swift
//  Core
//
//  Created by Gursimran Singh Gill on 2021-12-24.
//

import SwiftUI

public class FontLoader {
    static public func loadFont() {
        let fontsArray = [AppFonts.regular.rawValue, AppFonts.bold.rawValue, AppFonts.semibold.rawValue]
        for font in fontsArray {
            if let fontUrl = Core.bundle.url(forResource: font, withExtension: "ttf"),
               let dataProvider = CGDataProvider(url: fontUrl as CFURL),
               let newFont = CGFont(dataProvider) {
                var error: Unmanaged<CFError>?
                if !CTFontManagerRegisterGraphicsFont(newFont, &error) {
                    MobileLibLogger(FontLoader.self).d("Error loading Font!")
                } else {
                    MobileLibLogger(FontLoader.self).d("Loaded font")
                }
            } else {
                assertionFailure("Error loading font")
            }
        }
    }
}

public enum AppFonts: String {
    case regular = "Inter-Regular"
    case bold = "Inter-Bold"
    case semibold = "Inter-SemiBold"
}
