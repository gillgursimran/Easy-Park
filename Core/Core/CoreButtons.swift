//
//  CoreButtons.swift
//  EasyPark
//
//  Created by Gursimran Singh Gill on 2023-07-21.
//

import Foundation
import SwiftUI

public struct BorderedButton: View {
    var title: String
    var icon: Icon?
    var color: Color
    var backgroundColor: Color
    var width: Double
    var height: Double
    var titleSize: Double
    var cornerRadius: CGFloat
    var clicked: (() -> Void)

    public init(
        _ title: String,
        icon: Icon? = nil,
        color: Color,
        backgroundColor: Color = Colors.white,
        width: Double,
        height: Double = Dimens.defaultButtonHeight,
        titleSize: Double = Dimens.linkLabelSize,
        cornerRadius: CGFloat = Dimens.defaultCornerRadius,
        _ clicked: @escaping (() -> Void)
    ) {
        self.title = title
        self.icon = icon
        self.color = color
        self.backgroundColor = backgroundColor
        self.width = width
        self.height = height
        self.titleSize = titleSize
        self.cornerRadius = cornerRadius
        self.clicked = clicked
    }

    public var body: some View {
        Button(action: clicked) {
            HStack {
                Spacer()
                if icon != nil {
                    icon
                }
                Text(title)
                    .font(Font.custom("Inter-Regular", size: titleSize, relativeTo: .title2))
                Spacer()
            }
        }
        .foregroundColor(color)
        .frame(width: width, height: height)
        .background(backgroundColor)
        .cornerRadius(Dimens.defaultCornerRadius)
        .addRoundRectBorderOverlay(color, cornerRadius: cornerRadius)
    }
}

public struct FilledButton: View {
    var title: String
    var icon: Icon?
    var backgroundColor: Color
    var foregroundColor: Color
    var width: Double
    var height: Double
    var titleSize: Double
    var cornerRadius: CGFloat
    var isEnabled: Bool
    var clicked: (() -> Void)

    public init(
        _ title: String,
        icon: Icon? = nil,
        backgroundColor: Color = Colors.primaryBlue,
        foregroundColor: Color = Colors.white,
        width: Double = UIScreen.width - (2 * Dimens.spacingMedium),
        height: Double = Dimens.defaultButtonHeight,
        titleSize: Double = Dimens.defaultTextSize,
        cornerRadius: CGFloat = Dimens.defaultCornerRadius,
        isEnabled: Bool = true,
        _ clicked: @escaping (() -> Void)
    ) {
        self.title = title
        self.icon = icon
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.width = width
        self.height = height
        self.titleSize = titleSize
        self.cornerRadius = cornerRadius
        self.isEnabled = isEnabled
        self.clicked = clicked
    }

    public var body: some View {
        Button(action: clicked) {
            HStack {
                Spacer()
                if icon != nil {
                    icon
                }
                Text(title)
                    .font(Font.custom("Inter-Regular", size: titleSize, relativeTo: .body))
                Spacer()
            }
        }
        .frame(width: width, height: height)
        .background(isEnabled ? backgroundColor : Colors.primaryBlue)
        .foregroundColor(isEnabled ? foregroundColor : Colors.placeholderGrey)
        .cornerRadius(cornerRadius)
        .disabled(!isEnabled)
    }
}

public struct ButtonWithIcon: View {
    var text: String
    var icon: Icon
    var size: CGFloat
    var color: Color
    var clicked: (() -> Void)

    public init(
        text: String,
        icon: Icon,
        size: CGFloat,
        color: Color,
        _ clicked: @escaping (() -> Void)
    ) {
        self.text = text
        self.icon = icon
        self.size = size
        self.color = color
        self.clicked = clicked
    }

    public var body: some View {
        Button(action: clicked) {
            Label {
                Text(text)
                    .customText(size: size, color: color)
            } icon: {
                icon
            }
        }
    }
}

public struct FooterButton: View {
    var text: String
    var cornerRadius: CGFloat
    var height: CGFloat
    var backgroundColor: Color
    var foregroundColor: Color
    var containerBackgroundColor: Color
    var shadowOffsetX: CGFloat
    var shadowOffsetY: CGFloat
    var clicked: (() -> Void)

    public init(
        text: String,
        cornerRadius: CGFloat = 35.0,
        backgroundColor: Color = Colors.primaryBlue,
        foregroundColor: Color = Colors.white,
        containerBackgroundColor: Color = Colors.white,
        height: CGFloat = Dimens.footerSpacer,
        shadowOffsetX: CGFloat = 0,
        shadowOffsetY: CGFloat = -4,
        _ clicked: @escaping (() -> Void)
    ) {
        self.text = text
        self.cornerRadius = cornerRadius
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.containerBackgroundColor = containerBackgroundColor
        self.height = height
        self.shadowOffsetX = shadowOffsetX
        self.shadowOffsetY = shadowOffsetY
        self.clicked = clicked
    }

    public var body: some View {
        VStack {
            Spacer()

            VStack {
                FilledButton(
                    text,
                    backgroundColor: backgroundColor,
                    foregroundColor: foregroundColor,
                    cornerRadius: cornerRadius,
                    clicked
                )
                .padding(.top, Dimens.spacingSmall)
                .padding(.horizontal, Dimens.spacingXlarge)

                Spacer()
            }
            .frame(height: height)
            .background(containerBackgroundColor)
            .addShadow(offsetX: shadowOffsetX, offsetY: shadowOffsetY)
        }
        .ignoresSafeArea()
    }
}

public struct DropdownButton: View {
    var placeholder: String
    var secondaryTitle: String
    var primaryTitle: String
    var primaryColor: Color
    var fontWeight: Font.Weight
    var isDropdownVisible: Bool
    var showChevronIcon: Bool
    var clicked: (() -> Void)

    public init(
        placeholder: String,
        secondaryTitle: String,
        primaryTitle: String,
        primaryColor: Color = Colors.primaryGrey,
        fontWeight: Font.Weight = .regular,
        isDropdownVisible: Bool = false,
        showChevronIcon: Bool = true,
        _ clicked: @escaping (() -> Void)
    ) {
        self.placeholder = placeholder
        self.secondaryTitle = secondaryTitle
        self.primaryTitle = primaryTitle
        self.primaryColor = primaryColor
        self.fontWeight = fontWeight
        self.isDropdownVisible = isDropdownVisible
        self.showChevronIcon = showChevronIcon
        self.clicked = clicked
    }

    public var body: some View {
        Button(action: clicked) {
            HStack {
                if StringUtils.isEmpty(primaryTitle) {
                    OurText(placeholder, color: Colors.placeholderGrey, fontWeight: .regular)
                    Spacer()
                } else {
                    VStack(alignment: .leading) {
                        if !secondaryTitle.isEmpty {
                            SmallTitleText(secondaryTitle)
                        }
                        OurText(primaryTitle, color: primaryColor, fontWeight: fontWeight)
                    }
                }
                Spacer()
                if showChevronIcon {
//                    Icon(isDropdownVisible ? "Chevron_up" : "Chevron_down", bundle: SharedUI.bundle)
                }
            }
            .padding(.horizontal)
        }
        .frame(height: Dimens.defaultButtonHeight)
        .frame(maxWidth: .infinity)
        .addRoundedBackgroundColor(isDropdownVisible ? Colors.white : Colors.textFieldBackground)
        .addRoundRectBorderOverlay(isDropdownVisible ? Colors.primaryBlue : Colors.textFieldBackground)
    }
}

//public struct CheckboxButtonWithTitle: View {
//    var title: Text
//    var titleSize: CGFloat
//    var isSelected: Bool
//    let action: (Bool) -> Void
//
//    public init(
//        _ title: Text,
//        titleSize: CGFloat = Dimens.defaultTextSize,
//        isSelected: Bool,
//        action: @escaping (Bool) -> Void
//    ) {
//        self.title = title
//        self.titleSize = titleSize
//        self.isSelected = isSelected
//        self.action = action
//    }
//
//    public var body: some View {
//        Button(action: { self.action(!isSelected) }, label: {
//            HStack {
//                Icon(
//                    isSelected ? "CheckBoxFilled" : "CheckBoxEmpty",
//                    bundle: SharedUI.bundle,
//                    renderingMode: .original
//                )
//                title
//                    .customText(size: titleSize)
//                    .multilineTextAlignment(.leading)
//            }
//        })
//    }
//}

//public struct RadioButtonWithTitle: View {
//    var title: String
//    var isSelected: Bool
//    var image: Image?
//    let action: (String) -> Void
//
//    public init(_ title: String, isSelected: Bool, image: Image? = nil, action: @escaping (String) -> Void) {
//        self.title = title
//        self.isSelected = isSelected
//        self.image = image
//        self.action = action
//    }
//
//    public var body: some View {
//        Button(action: { self.action(self.title) }, label: {
//            HStack(spacing: 0) {
//                Icon(
//                    isSelected ? "RadioButtonSelected" : "RadioButtonDeselected",
//                    bundle: SharedUI.bundle,
//                    renderingMode: .original
//                )
//                .padding(.trailing, Dimens.spacingSmall)
//
//                if image != nil {
//                    image
//                        .padding(.trailing, Dimens.spacingXsmall)
//                }
//                OurText(title, color: Colors.primaryGrey)
//            }
//        })
//    }
//}
