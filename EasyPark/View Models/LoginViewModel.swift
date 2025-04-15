//
//  SigninViewModel.swift
//  EasyPark
//
//  Created by Gursimran Singh Gill on 2023-10-04.
//

import Foundation
import Combine
import Core
import Firebase

class LoginViewModel: BaseViewModel {
    @Injected(\.keychainHelper) private var keychainHelper: KeychainHelper
    @Injected(\.biometricAuthManager) private var biometricAuthManager: BiometricAuthManager
    
    private let tokenKey = "Easy123Park"
    private let tokenService = "com.EasyPark.token"
    
    @Published var isUnlocked = false
    @Published var errorMessage: String?
    
    @Published var email: String = ""
    @Published var isValidEmail: Bool = false
    @Published var emailError: String?
    
    @Published var password: String = ""
    @Published var isValidPaassword: Bool = false
    @Published var passwordError: String?
    
    @Published var formIsValid = false
    
    private var publishers = Set<AnyCancellable>()
    private let preferences = Preferences()
    
    @Published var isLoggedIn: Bool = false

    override init() {
        super.init()
        isLoggedIn = preferences.userLoggedInState()
        isLoginFormValidPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.formIsValid, on: self)
            .store(in: &publishers)
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password, completion: { [weak self] authResult, error in
            guard let user = authResult?.user, error == nil else {
                print(error!.localizedDescription)
                return
            }
            self?.isLoggedIn = true
            self?.preferences.setUserInfo(UserInfo(email: user.email, id: user.uid))
            print("User signed in: \(String(describing: user.email))")
        })
    }
    
    func storeToken(_ token: String) {
        if let data = token.data(using: .utf8) {
            keychainHelper.save(data, service: tokenService, account: tokenKey)
        }
    }
    
    func retrieveToken() -> String? {
        guard let data = keychainHelper.read(service: tokenService, account: tokenKey) else { return nil }
        return String(data: data, encoding: .utf8)
    }
    
    func authenticate() {
        biometricAuthManager.authenticate { success, error in
            if success {
                self.isUnlocked = true
                self.isLoggedIn = true
            } else {
                self.errorMessage = error?.localizedDescription ?? "Authentication failed"
            }
        }
    }
}

private extension LoginViewModel {
    var isValidEmailPublisher: AnyPublisher<Bool, Never> {
        $email
            .map { email in
                if !StringUtils.emailPredicate().evaluate(with: email) {
                    self.emailError = email.isEmpty ? nil : Strings.errorEmail
                    return false
                }
                self.emailError = nil
                return true
            }
            .eraseToAnyPublisher()
    }
    
    var isValidPasswordPublisher: AnyPublisher<Bool, Never> {
        $password
            .map { password in
                if password.count < 6 {
                    self.passwordError = password.isEmpty ? nil : Strings.errorPassword
                    return false
                }
                self.passwordError = nil
                return true
            }
            .eraseToAnyPublisher()
    }
    
    var isLoginFormValidPublisher: AnyPublisher<Bool, Never> {
        Publishers
            .CombineLatest(
                isValidEmailPublisher,
                isValidPasswordPublisher
            )
            .map { isEmailValid, isPasswordValid in
                return isEmailValid && isPasswordValid
            }
            .eraseToAnyPublisher()
      }
}
