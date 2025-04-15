//
//  OurNavigationView.swift
//  EasyPark
//
//  Created by Gursimran Singh Gill on 2023-08-15.
//

import SwiftUI

public struct OurNavigationView<Content: View>: View {
    let content: () -> Content

    public init(@ViewBuilder _ content: @escaping () -> Content) {
        self.content = content
    }

    public var body: some View {
        NavigationStack {
            content()
                .background(Colors.lightBackground)
        }
        .toolbarBackground(Colors.primaryBlue, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        // Prevents automatic split view on iPads.
        .navigationViewStyle(.stack)
        .navigationBarTitleDisplayMode(.inline)
        .accentColor(Colors.white)
    }
}
