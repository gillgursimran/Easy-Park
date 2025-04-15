//
//  LoginSignupViewModel.swift
//  EasyPark
//
//  Created by Gursimran Singh Gill on 2023-10-04.
//

import Foundation
import Combine
import Core

class LoginSignupViewModel: BaseViewModel {
    @Published var showSignInView: Bool = false
    @Published var showSignUpView: Bool = false
}
