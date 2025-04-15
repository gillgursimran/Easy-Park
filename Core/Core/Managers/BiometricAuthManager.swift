//
//  BiometricAuthManager.swift
//  EasyPark
//
//  Created by Gursimran Singh Gill on 2025-04-15.
//

import LocalAuthentication

public class BiometricAuthManager {
    
    public init() {}
    
    public func authenticate(reason: String = "Authenticate to continue", completion: @escaping (Bool, Error?) -> Void) {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authError in
                DispatchQueue.main.async {
                    completion(success, authError)
                }
            }
        } else {
            DispatchQueue.main.async {
                completion(false, error)
            }
        }
    }
}
