//
//  ResetPasswordViewModel.swift
//  EasyPark
//
//  Created by Gursimran Singh Gill on 2023-10-04.
//

import Foundation
import Combine
import Core

class ResetPasswordViewModel: BaseViewModel {
    @Published var email: String = ""
    @Published var isValidEmail: Bool = false
    @Published var emailError: String?
}
