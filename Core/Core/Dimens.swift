//
//  Dimens.swift
//  EasyPark
//
//  Created by Gursimran Singh Gill on 2023-07-21.
//

import Foundation
import SwiftUI

public struct Dimens {
    public static let spacingXsmall = CGFloat(4)
    public static let spacingSmall = CGFloat(8)
    public static let spacingRegular = CGFloat(12)
    public static let spacingMedium = CGFloat(16)
    public static let spacingLarge = CGFloat(24)
    public static let spacingXlarge = CGFloat(32)
    public static let spacingXXlarge = CGFloat(54)

    public static let iconSize = CGFloat(24)
    public static let xsmallIconSize = CGFloat(16)
    public static let smallIconSize = CGFloat(20)
    public static let listItemTitleSize = CGFloat(16)
    public static let listItemSubtitleSize = CGFloat(12)
    public static let listSectionTitleSize = CGFloat(14)

    public static let defaultTextSize = CGFloat(14)
    public static let defaultLabelSize = CGFloat(12)
    public static let smallLabelSize = CGFloat(10)
    public static let linkLabelSize = CGFloat(16)
    public static let defaultTitleSize = CGFloat(20)
    public static let largeTitleSize = CGFloat(22)
    public static let defaultTextViewHeight = CGFloat(220)
    public static let defaultTextFieldHeight = CGFloat(50)
    public static let textFieldErrorViewHeight = CGFloat(20)

    public static let buttonCornerRadius = CGFloat(32)
    public static let defaultCornerRadius = CGFloat(8)
    public static let defaultBorderWidth = CGFloat(1)

    public static let defaultButtonHeight = CGFloat(48)
    public static let toolBarButtonHeight = CGFloat(32)
    public static let actionButtonWidth = CGFloat(140)

    public static let maxDropdownHeight = CGFloat(288)

    public static let disabledOpacity = CGFloat(0.5)
    public static let defaultOpacity = CGFloat(1.0)
    public static let shadowOpacity = CGFloat(0.1)

    public static let tabBarShadowHeight = CGFloat(4)

    public static let defaultKeyboardToolBarHeight = CGFloat(44)
    public static let cardCornerRadius = CGFloat(8)
    public static let actionCornerRadius = CGFloat(30)

    public static let minSearchCharacterCount = 3
    public static let footerSpacer = CGFloat(80)

    public static let maxEmailFieldLength = 50
    public static let maxLocationFieldLength = 100
}

public extension UIScreen {
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
    static let size = UIScreen.main.bounds.size
}
