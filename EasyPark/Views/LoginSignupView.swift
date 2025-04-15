//
//  LoginView.swift
//  EasyPark
//
//  Created by Gursimran Singh Gill on 2023-07-21.
//

import SwiftUI
import Core

struct LoginSignupView: View {
    @StateObject var viewModel: LoginSignupViewModel = LoginSignupViewModel()

    var body: some View {
        OurNavigationView() {
            GeometryReader { geometry in
                VStack(spacing: Dimens.spacingMedium) {
                    Spacer()
                    Icon("Logo", bundle: EasyParkMain.bundle, renderingMode: .original)
                    Spacer()
                    
                    FilledButton(
                        Strings.signin,
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.textPrimaryBlue,
                        width: geometry.getWidth(),
                        titleSize: Dimens.defaultTitleSize
                    ) {
                        viewModel.showSignInView.toggle()
                    }
                    .navigationDestination(isPresented: $viewModel.showSignInView) { LoginView() }//TabBarView() }
                    
                    FilledButton(
                        Strings.register,
                        backgroundColor: Colors.primaryBlue,
                        foregroundColor: Colors.white,
                        titleSize: Dimens.defaultTitleSize
                    ) {
                        viewModel.showSignUpView.toggle()
                    }
                    .navigationDestination(isPresented: $viewModel.showSignUpView) { SignUpView() }
                    
//                    FilledButton(
//                        Strings.signinWithApple,
//                        icon: Icon("AppleLogo", bundle:EasyParkMain.bundle, renderingMode: .original),
//                        backgroundColor: Colors.black,
//                        foregroundColor: Colors.white,
//                        titleSize: Dimens.defaultTitleSize
//                    ) {
//                        
//                    }
                }
                .padding()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginSignupView()
    }
}
