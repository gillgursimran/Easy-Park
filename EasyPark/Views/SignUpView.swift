//
//  SignUpView.swift
//  EasyPark
//
//  Created by Gursimran Singh Gill on 2023-08-15.
//

import SwiftUI
import Core

struct SignUpView: View {
    @StateObject var viewModel: SignUpViewModel = SignUpViewModel()

    var body: some View {
        OurNavigationView {
            GeometryReader { geometry in
                VStack(spacing: Dimens.spacingMedium) {
                    Spacer()
                    Icon("Logo", bundle: EasyParkMain.bundle, renderingMode: .original)
                    Spacer()
                    
                    VStack(spacing: Dimens.spacingMedium) {
                        OurTextField(
                            placeholder: Strings.placeholderFirstName,
                            text: $viewModel.firstName,
                            isValid: $viewModel.isValidFirstName,
                            error: $viewModel.firstNameError,
                            emptyMessage: Strings.requiredField,
                            keyboardType: .asciiCapable,
                            textFieldType: .square
                        )
                        
                        OurTextField(
                            placeholder: Strings.placeholderLastName,
                            text: $viewModel.lastName,
                            isValid: $viewModel.isValidLastName,
                            error: $viewModel.lastNameError,
                            emptyMessage: Strings.requiredField,
                            keyboardType: .asciiCapable,
                            textFieldType: .square
                        )
                        
                        OurTextField(
                            placeholder: Strings.placeholderEmail,
                            text: $viewModel.email,
                            isValid: $viewModel.isValidEmail,
                            error: $viewModel.emailError,
                            emptyMessage: Strings.requiredField,
                            keyboardType: .asciiCapable,
                            textFieldType: .square
                        )
                                                
                        OurTextField(
                            placeholder: Strings.placeholderPassword,
                            text: $viewModel.password,
                            isValid: $viewModel.isValidPaassword,
                            error: $viewModel.passwordError,
                            emptyMessage: Strings.requiredField,
                            keyboardType: .asciiCapable,
                            textFieldType: .square
                        )
                    }
                    
                    FilledButton(
                        Strings.register,
                        backgroundColor: Colors.primaryBlue,
                        foregroundColor: Colors.white,
                        titleSize: Dimens.defaultTitleSize
                    ) {
                        viewModel.signUp()
                    }
                    .padding(.top, Dimens.spacingLarge)
                    .setDisabled(!viewModel.formIsValid)
//                    .disabled(!viewModel.formIsValid)
                    
                    HStack(spacing: 0) {
                        OurText("Already a member? ")
                        OurText("Sign in.", fontWeight: .bold)
                            .onTap {
                                
                            }
                    }
                    
                }
                .padding()
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
