//
//  ListItem.swift
//  Core
//
//  Created by Gursimran Singh Gill on 2024-03-06.
//

import SwiftUI

/// A default View to be used as a row in a List.
public struct ListItem<Trailing: View, Destination: View>: View {
    var icon: String?
    var bundle: Bundle?
    var title: String?
    var subtitle: String?
    var secondSubtitle: String?
    var showDivider: Bool = true
    var fullWidthDivider: Bool = false
    var titleColor: Color = Colors.primaryGrey
    var subtitleColor: Color = Colors.secondaryGrey
    var titleSizeListItem: CGFloat = Dimens.listItemTitleSize
    var subtitleSizeListItem: CGFloat = Dimens.listItemSubtitleSize
    var linkText: String?
    var destination: (() -> Destination)?
    var forceShowRightChevron = false

    /// A view that shows at the end of the row. If `destination != nil`, `trailing` is shown to the left of a
    /// right chevron icon.
    var trailing: (() -> Trailing)?

    public init(
        icon: String? = nil,
        bundle: Bundle? = nil,
        title: String? = nil,
        subtitle: String? = nil,
        secondSubtitle: String? = nil,
        showDivider: Bool = true,
        fullWidthDivider: Bool = false,
        titleColor: Color = Colors.primaryGrey,
        subtitleColor: Color = Colors.secondaryGrey,
        @ViewBuilder destination: @escaping () -> Destination,
        @ViewBuilder trailing: @escaping () -> Trailing
    ) {
        self.icon = icon
        self.bundle = bundle
        self.title = title
        self.subtitle = subtitle
        self.secondSubtitle = secondSubtitle
        self.showDivider = showDivider
        self.fullWidthDivider = fullWidthDivider
        self.titleColor = titleColor
        self.subtitleColor = subtitleColor
        self.destination = destination
        self.trailing = trailing
    }

    public var body: some View {
        VStack(spacing: 0) {
            VStack {
                if destination == nil {
                    content
                } else {
                    NavigationLink(destination: self.destination!()) {
                        content
                    }
                }
            }
            .padding(.leading, Dimens.spacingMedium)

            if showDivider {
                Divider()
                    .modifyIf(!fullWidthDivider, transform: { divider in
                        // Add leading padding here so divider doesn't stretch to the edge of the screen.
                        divider
                            .padding(.leading, Dimens.spacingMedium)
                    })
            }
        }
    }

    private var content: some View {
        HStack(spacing: 0) {
            if StringUtils.isNotEmpty(icon) && bundle != nil {
                Icon(icon!, bundle: bundle!)
                    .padding(.trailing, Dimens.spacingMedium)
            }

            VStack(alignment: .leading, spacing: 0) {
                if StringUtils.isNotEmpty(title) {
                    if linkText == title {
                        LinkText(title!, textSize: titleSizeListItem, isUnderlined: true)
                            .customText(
                                size: titleSizeListItem,
                                color: titleSizeListItem >= subtitleSizeListItem
                                    ? titleColor
                                    : subtitleColor
                            )
                    } else {
                        OurText(
                            title!,
                            size: titleSizeListItem,
                            color: titleSizeListItem >= subtitleSizeListItem
                                ? titleColor
                                : subtitleColor
                        )
                        .lineLimit(1)
                    }
                }
                if StringUtils.isNotEmpty(subtitle) {
                    if linkText == subtitle {
                        LinkText(subtitle!, textSize: subtitleSizeListItem, isUnderlined: true)
                            .customText(
                                size: subtitleSizeListItem,
                                color: titleSizeListItem >= subtitleSizeListItem
                                    ? titleColor
                                    : subtitleColor
                            )
                    } else {
                        OurText(
                            subtitle!,
                            size: subtitleSizeListItem,
                            color: titleSizeListItem >= subtitleSizeListItem
                                ? subtitleColor
                                : titleColor
                        )
                        .lineLimit(1)
                    }
                }
                if StringUtils.isNotEmpty(secondSubtitle) {
                    OurText(
                        secondSubtitle!,
                        size: subtitleSizeListItem,
                        color: titleSizeListItem >= subtitleSizeListItem
                            ? subtitleColor
                            : titleColor
                    )
                    .lineLimit(1)
                }
            }
            .modifyIf(!StringUtils.isNotEmpty(subtitle), transform: { vStack in
                vStack.padding(.top, Dimens.spacingXsmall)
                    .padding(.bottom, Dimens.spacingXsmall)
            })

            Spacer(minLength: Dimens.spacingMedium)
            trailing?()

            if showRightChevron {
                RightChevronIcon()
                    .padding(.leading, Dimens.spacingSmall)
            }
        }
        .padding(.top, Dimens.spacingMedium)
        .padding(.bottom, Dimens.spacingMedium)

        // Smaller spacing with right chevron to account for image's padding.
        // Add trailing padding here so divider streches to the edge of the screen.
        .padding(.trailing, showRightChevron ? Dimens.spacingSmall : Dimens.spacingMedium)

        // Allows entire row to be clickable.
        .contentShape(Rectangle())
    }

    private var showRightChevron: Bool {
        return forceShowRightChevron || self.destination != nil
    }
}

public extension ListItem where Destination == EmptyView {
    init(title: String?, showDivider: Bool = true, @ViewBuilder trailing: @escaping () -> Trailing) {
        self.title = title
        self.showDivider = showDivider
        self.trailing = trailing
    }

    init(
        title: String?,
        subtitle: String? = "",
        secondSubtitle: String? = "",
        showDivider: Bool = true,
        fullWidthDivider: Bool,
        titleColor: Color = Colors.primaryGrey,
        subtitleColor: Color = Colors.secondaryGrey,
        titleSizeListItem: CGFloat = Dimens.listItemTitleSize,
        subtitleSizeListItem: CGFloat = Dimens.listItemSubtitleSize,
        linkText: String? = nil,
        @ViewBuilder trailing: @escaping () -> Trailing
    ) {
        self.title = title
        self.subtitle = subtitle
        self.secondSubtitle = secondSubtitle
        self.showDivider = showDivider
        self.fullWidthDivider = fullWidthDivider
        self.titleColor = titleColor
        self.subtitleColor = subtitleColor
        self.titleSizeListItem = titleSizeListItem
        self.subtitleSizeListItem = subtitleSizeListItem
        self.linkText = linkText
        self.trailing = trailing
    }

    init(icon: String?,
         bundle: Bundle?,
         title: String?,
         subtitle: String?,
         secondSubtitle: String? = nil,
         showDivider: Bool,
         forceShowRightChevron: Bool,
         @ViewBuilder trailing: @escaping () -> Trailing
    ) {
        self.icon = icon
        self.bundle = bundle
        self.title = title
        self.subtitle = subtitle
        self.secondSubtitle = secondSubtitle
        self.showDivider = showDivider
        self.forceShowRightChevron = forceShowRightChevron
        self.trailing = trailing
    }
}

public extension ListItem where Trailing == EmptyView {
    init(title: String?, showDivider: Bool = true, @ViewBuilder destination: @escaping () -> Destination) {
        self.title = title
        self.showDivider = showDivider
        self.destination = destination
    }

    init(
        title: String?,
        subtitle: String?,
        secondSubtitle: String? = nil,
        showDivider: Bool = true,
        fullWidthDivider: Bool = false,
        titleSizeListItem: CGFloat = Dimens.listItemTitleSize,
        subtitleSizeListItem: CGFloat = Dimens.listItemSubtitleSize,
        destination: @escaping () -> Destination
    ) {
        self.title = title
        self.subtitle = subtitle
        self.secondSubtitle = secondSubtitle
        self.showDivider = showDivider
        self.fullWidthDivider = fullWidthDivider
        self.titleSizeListItem = titleSizeListItem
        self.subtitleSizeListItem = subtitleSizeListItem
        self.destination = destination
    }
}

public extension ListItem where Trailing == EmptyView, Destination == EmptyView {
    init(
        icon: String?,
        bundle: Bundle?,
        title: String?,
        subtitle: String?,
        secondSubtitle: String? = nil
    ) {
        self.icon = icon
        self.bundle = bundle
        self.title = title
        self.subtitle = subtitle
        self.secondSubtitle = secondSubtitle
    }

    init(
        title: String?,
        subtitle: String?,
        titleColor: Color = Colors.primaryGrey,
        subtitleColor: Color = Colors.secondaryGrey,
        showDivider: Bool = true,
        fullWidthDivider: Bool = false,
        titleSizeListItem: CGFloat = Dimens.listItemTitleSize,
        subtitleSizeListItem: CGFloat = Dimens.listItemSubtitleSize
    ) {
        self.title = title
        self.subtitle = subtitle
        self.titleColor = titleColor
        self.subtitleColor = subtitleColor
        self.showDivider = showDivider
        self.fullWidthDivider = fullWidthDivider
        self.titleSizeListItem = titleSizeListItem
        self.subtitleSizeListItem = subtitleSizeListItem
    }

    init(title: String?) {
        self.title = title
    }

    init(title: String?, showDivider: Bool = true) {
        self.title = title
        self.showDivider = showDivider
    }

    init(
        title: String?,
        showDivider: Bool = true,
        fullWidthDivider: Bool = false,
        titleSizeListItem: CGFloat = Dimens.listItemTitleSize,
        forceShowRightChevron: Bool
    ) {
        self.title = title
        self.showDivider = showDivider
        self.fullWidthDivider = fullWidthDivider
        self.titleSizeListItem = titleSizeListItem
        self.forceShowRightChevron = forceShowRightChevron
    }
 }
