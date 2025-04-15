//
//  SigninView.swift
//  EasyPark
//
//  Created by Gursimran Singh Gill on 2023-10-04.
//

import SwiftUI
import Core

struct LoginView: View {
    @StateObject var viewModel: LoginViewModel = LoginViewModel()
    
    var body: some View {
        OurNavigationView {
            GeometryReader { geometry in
                VStack(spacing: Dimens.spacingMedium) {
                    Spacer()
                    Icon("Logo", bundle: EasyParkMain.bundle, renderingMode: .original)
                    Spacer()
                    
                    VStack(spacing: Dimens.spacingMedium) {
                        
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
                    
                        FilledButton(
                            Strings.signin,
                            backgroundColor: Colors.primaryBlue,
                            foregroundColor: Colors.white,
                            titleSize: Dimens.defaultTitleSize
                        ) {
                            viewModel.login()
                        }
                        .padding(.top, Dimens.spacingLarge)
                        .setDisabled(!viewModel.formIsValid)
                        
                        FilledButton(
                            Strings.signWithFaceID,
                            backgroundColor: Colors.primaryBlue,
                            foregroundColor: Colors.white,
                            titleSize: Dimens.defaultTitleSize
                        ) {
                            viewModel.authenticate()
                        }
                        .padding(.top, Dimens.spacingLarge)
                        
                        HStack(spacing: 0) {
                            OurText("Forgot password? ")
                            OurText("Click here.", fontWeight: .bold)
                                .onTap {
                                    
                                }
                        }
                        
                        if let error = viewModel.errorMessage {
                            Text(error)
                                .foregroundColor(.red)
                                .multilineTextAlignment(.center)
                                .padding()
                                .background(Color.red.opacity(0.1))
                                .cornerRadius(8)
                                .padding(.horizontal)
                        }
                    }
                    .navigationDestination(isPresented: $viewModel.isLoggedIn){ TabBarView() }
                }
                .padding()
            }
        }
    }
}

struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
