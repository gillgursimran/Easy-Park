//
//  GroupedListView.swift
//  SharedUI
//
//  Created by Gursimran Singh Gill on 2022-09-13.
//

import SwiftUI

public struct GroupedListView<Content: View>: View {
    private let listTitle: String
    private let content: Content

    public init(listTitle: String = "", @ViewBuilder contentProvider: () -> Content) {
        self.listTitle = listTitle
        content = contentProvider()
    }

    public var body: some View {
        ScrollView {
            if StringUtils.isNotEmpty(listTitle) {
                OurText(listTitle, color: Colors.secondaryGrey)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.horizontal, .top])
            }
            VStack {
                content
            }
        }
    }
}

public struct GroupedListSection: View {
    var sectionTitle: Text
    var titleSize: CGFloat
    var titleColor: Color?
    var listItems: [GroupedItem]
    var emptyListlabel: String
    var onTapItem: ((String) -> Void)

    public init(
        sectionTitle: Text,
        titleSize: CGFloat = Dimens.defaultTextSize,
        titleColor: Color? = nil,
        listItems: [GroupedItem],
        emptyListlabel: String = "",
        onTapItem: @escaping ((String) -> Void)
    ) {
        self.sectionTitle = sectionTitle
        self.titleSize = titleSize
        self.titleColor = titleColor
        self.listItems = listItems
        self.emptyListlabel = emptyListlabel
        self.onTapItem = onTapItem
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: Dimens.spacingMedium) {
            sectionTitle
                .modifyIf(titleColor != nil) { title in
                    title
                        .foregroundColor(titleColor)
                }
                .customText(size: titleSize)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .multilineTextAlignment(.leading)
            if listItems.count == 0 {
                VStack {
                    HorizontalLine()
                    OurText(emptyListlabel, color: Colors.secondaryGrey)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.vertical, Dimens.spacingSmall)
                    HorizontalLine()
                }
                .background(Color.white)
            }
            VStack(alignment: .leading, spacing: 0) {
                ForEach(listItems, id: \.itemId) { item in
                    VStack(spacing: .zero) {
                        HorizontalLine()
                        HStack(spacing: .zero) {
                            if let icon = item.leadingIcon {
                                icon
                                    .padding(.leading)
                            }
                            ListItem(
                                title: item.title.capitalized,
                                subtitle: item.subtitle.capitalized,
                                showDivider: false,
                                fullWidthDivider: false,
                                titleSizeListItem: Dimens.defaultTextSize,
                                subtitleSizeListItem: Dimens.defaultLabelSize,
                                trailing: {
                                    if item.hasDetails {
                                        RightChevronIcon()
                                    }
                                }
                            )
                        }
                        .onTap {
                            onTapItem(item.itemId)
                        }

                        if item.itemId == listItems.last!.itemId {
                            HorizontalLine()
                        }
                    }
                }
            }
            .background(Color.white)
        }
        .padding(.top)
    }
}

public struct GroupedItem {
    var itemId: String
    var title: String
    var subtitle: String
    var leadingIcon: Icon?
    var hasDetails: Bool

    public init(itemId: String, title: String, subtitle: String, leadingIcon: Icon? = nil, hasDetails: Bool = true) {
        self.itemId = itemId
        self.title = title
        self.subtitle = subtitle
        self.leadingIcon = leadingIcon
        self.hasDetails = hasDetails
    }
}
