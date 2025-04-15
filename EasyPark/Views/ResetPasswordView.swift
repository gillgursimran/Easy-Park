//
//  ResetPasswordView.swift
//  EasyPark
//
//  Created by Gursimran Singh Gill on 2023-10-04.
//

import SwiftUI
import Core

struct ResetPasswordView: View {
    @StateObject var viewModel: SignUpViewModel = SignUpViewModel()

    var body: some View {
        OurNavigationView {
            GeometryReader { geometry in
                VStack(spacing: Dimens.spacingMedium) {
                    Spacer()
                    Icon("Logo", bundle: EasyParkMain.bundle, renderingMode: .original)
                    Spacer()
                    
                    VStack(spacing: Dimens.spacingMedium) {
                        OurText(Strings.forgotPasswordHeader, color: Colors.secondaryGrey)
                        
                        OurTextField(
                            placeholder: Strings.placeholderEmail,
                            text: $viewModel.email,
                            isValid: $viewModel.isValidEmail,
                            error: $viewModel.emailError,
                            emptyMessage: Strings.requiredField,
                            keyboardType: .asciiCapable,
                            textFieldType: .square
                        )
                    
                        FilledButton(
                            Strings.resetPassword,
                            backgroundColor: Colors.primaryBlue,
                            foregroundColor: Colors.white,
                            titleSize: Dimens.defaultTitleSize
                        ) {
                            
                        }
                        .padding(.top, Dimens.spacingLarge)
                    }
                }
                .padding()
            }
        }
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
