//
//  Injection+Core.swift
//  EasyPark
//
//  Created by Gursimran Singh Gill on 2023-08-29.
//

import Foundation

private struct DispatchQueueKey: InjectionKey {
    static var currentValue: DispatchQueueType = DispatchQueue.main
}

private struct BiometricAuthManagerKey: InjectionKey {
    static var currentValue: BiometricAuthManager = BiometricAuthManager()
}

private struct KeychainHelperKey: InjectionKey {
    static var currentValue: KeychainHelper = KeychainHelper()
}

public extension InjectedValues {
    var dispatchQueue: DispatchQueueType {
        get { Self[DispatchQueueKey.self] }
        set { Self[DispatchQueueKey.self] = newValue }
    }
    
    var biometricAuthManager: BiometricAuthManager {
        get { Self[BiometricAuthManagerKey.self] }
        set { Self[BiometricAuthManagerKey.self] = newValue }
    }
    
    var keychainHelper: KeychainHelper {
        get { Self[KeychainHelperKey.self] }
        set { Self[KeychainHelperKey.self] = newValue }
    }
}
