//
//  SignUpView.swift
//  EasyPark
//
//  Created by Gursimran Singh Gill on 2023-08-15.
//

import SwiftUI
import Core

struct SignUpTypeView: View {
    var body: some View {
        OurNavigationView {
            GeometryReader { geometry in
                VStack(spacing: Dimens.spacingMedium) {
                    Spacer()
                    Icon("Logo", bundle: EasyParkMain.bundle, renderingMode: .original)
                    Spacer()
                    
                    FilledButton(
                        Strings.signinAsDriver,
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.textPrimaryBlue,
                        width: geometry.getWidth(),
                        titleSize: Dimens.defaultTitleSize
                    ) {
                        
                    }
                    
                    FilledButton(
                        Strings.signinAsOwner,
                        backgroundColor: Colors.primaryBlue,
                        foregroundColor: Colors.white,
                        titleSize: Dimens.defaultTitleSize
                    ) {
                        
                    }
                    
                }
                .padding()
            }
        }
    }
}

struct SignUpTypeView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpTypeView()
    }
}
