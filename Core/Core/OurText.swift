//
//  OurText.swift
//  EasyPark
//
//  Created by Gursimran Singh Gill on 2023-07-21.
//

import SwiftUI

public struct OurText: View {
    var text: String
    var size: CGFloat?
    var color: Color?
    var fontWeight: Font.Weight?
    var fontStyle: Font.TextStyle
    var font: String?

    public init(
        _ text: String,
        size: CGFloat = Dimens.defaultTextSize,
        color: Color = .black,
        fontWeight: Font.Weight = .regular,
        fontStyle: Font.TextStyle = .body,
        font: String = AppFonts.regular.rawValue
    ) {
        self.text = text
        self.size = size
        self.color = color
        self.fontWeight = fontWeight
        self.fontStyle = fontStyle
        self.font = font
    }

    public var body: some View {
        Text(text)
            .modifier(CustomText(size: size!, color: color!, fontWeight: fontWeight!, fontStyle: fontStyle, font: font!))
    }
 }

public struct LinkText: View {
    var text: String
    var textSize: CGFloat
    var textColor: Color
    var isUnderlined: Bool

    public init(
        _ text: String,
        textSize: CGFloat = Dimens.linkLabelSize,
        textColor: Color = Colors.primaryBlue,
        isUnderlined: Bool = false
    ) {
        self.text = text
        self.isUnderlined = isUnderlined
        self.textSize = textSize
        self.textColor = textColor
    }

    public var body: some View {
        Text(text)
            .modifyIf(isUnderlined, transform: { text in
                text
                    .underline()
            })
            .modifier(CustomText(
                size: textSize,
                color: textColor,
                fontWeight: .regular,
                font: "Inter-Regular"
            ))
            .multilineTextAlignment(.leading)
    }
 }

public struct TitleText: View {
    var text: String
    var size: CGFloat
    var color: Color

    public init(_ text: String, size: CGFloat = Dimens.listItemTitleSize, color: Color = .black) {
        self.text = text
        self.size = size
        self.color = color
    }

    public var body: some View {
        Text(text)
            .modifier(CustomText(
                size: size,
                color: color,
                fontWeight: .semibold,
                font: "Inter-Regular"
            ))
    }
 }

public struct SmallTitleText: View {
    var text: String
    var color: Color?

    public init(_ text: String, color: Color = Colors.secondaryGrey) {
        self.text = text
        self.color = color
    }

    public var body: some View {
        Text(text)
            .modifier(CustomText(
                size: Dimens.smallLabelSize,
                color: color!,
                fontWeight: .regular,
                font: "Inter-Regular"
            ))
    }
 }
