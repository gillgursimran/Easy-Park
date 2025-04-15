//
//  CustomText.swift
//  EasyPark
//
//  Created by Gursimran Singh Gill on 2023-07-21.
//

import Foundation
import SwiftUI
import UIKit

struct CustomText: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory
    var size: CGFloat
    var color: Color
    var fontWeight: Font.Weight
    var fontStyle: Font.TextStyle = .body
    var font: String

    func body(content: Content) -> some View {
        let scaledSize = UIFontMetrics.default.scaledValue(for: size)
        return content
                   .font(.custom(font, size: scaledSize, relativeTo: fontStyle)
                   .weight(fontWeight))
                   .foregroundColor(color)
    }
}

extension View {
    public func customText(
        size: CGFloat = Dimens.defaultTextSize,
        color: Color = .black,
        fontWeight: Font.Weight = .regular,
        fontStyle: Font.TextStyle = .body,
        font: String = "Inter-Regular"
    ) -> some View {
        return self.modifier(CustomText(size: size, color: color, fontWeight: fontWeight, fontStyle: fontStyle, font: font))
    }
}

public extension Text {
    func asFormErrorMessage() -> some View {
        self.font(.system(size: Dimens.defaultLabelSize))
            .foregroundColor(.red)
            .italic()
    }
}

public extension Text {
    func errorMessageStyle() -> Text {
        self.foregroundColor(.red)
            .italic()
    }
}


