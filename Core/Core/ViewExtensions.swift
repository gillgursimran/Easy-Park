//
//  ViewExtensions.swift
//  EasyPark
//
//  Created by Gursimran Singh Gill on 2023-07-21.
//

import SwiftUI
import Foundation

public extension View {
    func underline() -> some View {
        self.padding(.vertical, 10)
            .overlay(
                Rectangle()
                    .frame(height: 1)
                    .padding(.top, 35)
                    .foregroundColor(.gray)
            )
    }

    @ViewBuilder
    func isHidden(_ isHidden: Bool) -> some View {
        if isHidden {
            self.hidden()
        } else {
            self
        }
    }

//    func alert(isPresented: Binding<Bool>, _ alert: TextFieldAlert) -> some View {
//        AlertWrapper(isPresented: isPresented, alert: alert, content: self)
//    }
}

public extension View {
    @ViewBuilder func modifyIf<Content: View>(
        _ condition: @autoclosure () -> Bool,
        transform: (Self) -> Content
    ) -> some View {
        if condition() {
            transform(self)
        } else {
            self
        }
    }
}

public extension View {
    func onTap(tapped: @escaping () -> Void) -> some View {
        modifier(OnTap(tapped: tapped))
    }
}

private struct OnTap: ViewModifier {
    var tapped: () -> Void

    func body(content: Content) -> some View {
        Button {
            tapped()
        } label: {
            content
        }
    }
}

private struct SetDisabled: ViewModifier {
    var disabled: Bool

    func body(content: Content) -> some View {
        return content
            .disabled(disabled)
            .allowsHitTesting(!disabled)
            .opacity(disabled ? Dimens.disabledOpacity : Dimens.defaultOpacity)
    }
}

public extension View {
    func setDisabled(_ disabled: Bool) -> some View {
        modifier(SetDisabled(disabled: disabled))
    }
}

private struct AddShadow: ViewModifier {
    var offsetX: CGFloat
    var offsetY: CGFloat

    func body(content: Content) -> some View {
        return content
            .shadow(
                color: Colors.primaryGrey.opacity(Dimens.shadowOpacity),
                radius: Dimens.defaultCornerRadius,
                x: offsetX,
                y: offsetY
            )
    }
}

public extension View {
    func addShadow(offsetX: CGFloat = 0, offsetY: CGFloat = 0) -> some View {
        modifier(AddShadow(offsetX: offsetX, offsetY: offsetY))
    }
}

private struct AddRoundRectBorderOverlay: ViewModifier {
    var borderColor: Color
    var borderWidth: CGFloat
    var cornerRadius: CGFloat
    var corners: UIRectCorner

    func body(content: Content) -> some View {
        return content
            .overlay(
                ViewShape(roundCorners: corners, radius: cornerRadius)
                    .stroke(borderColor, lineWidth: borderWidth)
            )
    }
}

public extension View {
    func addRoundRectBorderOverlay(
        _ borderColor: Color,
        borderWidth: CGFloat = Dimens.defaultBorderWidth,
        cornerRadius: CGFloat = Dimens.defaultCornerRadius,
        roundCorners: UIRectCorner = .allCorners
    ) -> some View {
        modifier(AddRoundRectBorderOverlay(
            borderColor: borderColor,
            borderWidth: borderWidth,
            cornerRadius: cornerRadius,
            corners: roundCorners
        ))
    }
}

private struct AddRoundedBackgroundColor: ViewModifier {
    var backgroundColor: Color
    var cornerRadius: CGFloat
    var corners: UIRectCorner
    var addShadow: Bool

    func body(content: Content) -> some View {
        return content
            .background(
                backgroundColor
                    .clipShape(ViewShape(roundCorners: corners, radius: cornerRadius))
                    .modifyIf(addShadow, transform: { background in
                        background
                            .addShadow(offsetX: 0, offsetY: 2)
                    })
            )
    }
}

public extension View {
    func addRoundedBackgroundColor(
        _ backgroundColor: Color,
        cornerRadius: CGFloat = Dimens.defaultCornerRadius,
        roundCorners: UIRectCorner = .allCorners,
        addShadow: Bool = false
    ) -> some View {
        modifier(
            AddRoundedBackgroundColor(
                backgroundColor: backgroundColor,
                cornerRadius: cornerRadius,
                corners: roundCorners,
                addShadow: addShadow
            )
        )
    }
}

private struct ViewShape: Shape {
    var roundCorners = UIRectCorner.allCorners
    var radius: CGFloat = Dimens.defaultCornerRadius

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: roundCorners,
            cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

private struct AddSmallTitle: ViewModifier {
    let isVisible: Bool
    let titleText: String

    @ViewBuilder
    func body(content: Content) -> some View {
        if isVisible {
            VStack(alignment: .leading) {
                Spacer()
                SmallTitleText(titleText)
                Spacer(minLength: 0)
                content
                Spacer()
            }
        } else {
            Spacer()
            content
            Spacer()
        }
    }
}

public extension View {
    func addSmallTitle(_ isVisible: Bool, _ titleText: String ) -> some View {
        modifier(AddSmallTitle(isVisible: isVisible, titleText: titleText))
    }
}

private struct AddRequiredFieldFooter: ViewModifier {
    let isVisible: Bool
    let requiredText: String
    let textColor: Color

    @ViewBuilder
    func body(content: Content) -> some View {
        if isVisible {
            VStack(alignment: .leading) {
                content
                SmallTitleText(requiredText, color: textColor)
            }
        } else {
            content
        }
    }
}

public extension View {
    func addRequiredFieldFooter(
        _ isVisible: Bool,
        _ requiredText: String,
        textColor: Color = Colors.red
    ) -> some View {
        modifier(AddRequiredFieldFooter(isVisible: isVisible, requiredText: requiredText, textColor: textColor))
    }
}

public struct VerticalLine: View {
    private var color: Color

    public init(_ color: Color = Colors.borderGrey) {
        self.color = color
    }

    public var body: some View {
        Rectangle()
            .frame(width: 1)
            .foregroundColor(color)
    }
}

public struct HorizontalLine: View {
    private var color: Color

    public init(_ color: Color = Colors.borderGrey) {
        self.color = color
    }

    public var body: some View {
        Rectangle()
            .frame(maxWidth: .infinity)
            .frame(height: 1)
            .foregroundColor(color)
    }
}

public extension View {
    func addCardBackground(_ backgroundColor: Color ) -> some View {
        modifier(AddCardBackground(backgroundColor: backgroundColor))
    }
}

private struct AddCardBackground: ViewModifier {
    let backgroundColor: Color

    @ViewBuilder
    func body(content: Content) -> some View {
        VStack(alignment: .leading) {
            content
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .addRoundedBackgroundColor(backgroundColor, cornerRadius: Dimens.cardCornerRadius, addShadow: true)
        }
    }
}

public extension View {
    func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
