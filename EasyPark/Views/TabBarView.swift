//
//  TabBarView.swift
//  EasyPark
//
//  Created by Gursimran Singh Gill on 2023-11-21.
//

import SwiftUI
import Core

struct TabBarView: View {
    public var body: some View {
        GeometryReader { geometry in
            TabView {
                OurNavigationView {
                    ParkingListView()
                }
                .tabItem {
                    HStack {
                        OurText(Strings.home)
                        Icon("Home", bundle: EasyParkMain.bundle)
                    }
                }

                OurNavigationView {
                    FavouritesView()
                }
                .tabItem {
                    HStack {
                        OurText(Strings.favourites)
                        Icon("Favourites", bundle: EasyParkMain.bundle)
                    }
                }
                
                OurNavigationView {
                    ProfileView()
                }
                .tabItem {
                    HStack {
                        OurText(Strings.profile)
                        Icon("Profile", bundle: EasyParkMain.bundle)
                    }
                }
//                .navigationTitle(Strings.roadsideInspectionMenuSchedules)
            }
            .navigationBarTitleDisplayMode(.inline)
            .accentColor(Colors.primaryBlue)
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                    HStack {
                        Icon("LogoSmall", bundle: EasyParkMain.bundle, renderingMode: .original)
                        OurText(Strings.appName, size: Dimens.linkLabelSize, color: Colors.white, fontWeight: .medium)
                    }
                }
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                    Icon("Slider", bundle: EasyParkMain.bundle, renderingMode: .original)
                }
            }
            .navigationBarBackButtonHidden()
//            .overlay(
//                VStack {
//                    if !keyboardVisible {
//                        Spacer()
//                        FilledButton(
//                            Strings.endRoadsideInspection,
//                            width: geometry.getWidth(),
//                            cornerRadius: Dimens.buttonCornerRadius
//                        ) {
//                            isInpectionStarted.toggle()
//                        }
//                        .padding(.bottom, Dimens.defaultButtonHeight + Dimens.spacingMedium)
//                    }
//                }
//            )
//            .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { _ in
//                keyboardVisible = true
//            }
//            .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { _ in
//                keyboardVisible = false
//            }
        }
    }

}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
