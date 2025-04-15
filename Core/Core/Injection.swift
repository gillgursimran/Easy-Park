//
//  Injection.swift
//  EasyPark
//
//  Created by Gursimran Singh Gill on 2023-08-29.
//
//  This dependency injection method was designed by ANTOINE VAN DER LEE, and made public on his blog:
//  https://www.avanderlee.com/swift/dependency-injection/.
//

import Foundation

/// A property wrapper for injecting values into an object. Usage:
/// ```
/// @Injected(\.authManager) var authManager: AuthManager
/// ```
@propertyWrapper
public struct Injected<T> {
    private let keyPath: WritableKeyPath<InjectedValues, T>

    public var wrappedValue: T {
        get { InjectedValues[keyPath] }
        set { InjectedValues[keyPath] = newValue }
    }

    public init(_ keyPath: WritableKeyPath<InjectedValues, T>) {
        self.keyPath = keyPath
    }
}

public struct InjectedValues {
    /// This is only used as an accessor to the computed properties within extensions of `InjectedValues`.
    private static var current = InjectedValues()

    /// A static subscript for updating the `currentValue` of `InjectionKey` instances. Usage:
    /// ```
    /// InjectedValues[\.authManager] = MockAuthManager()
    /// ```
    public static subscript<K>(key: K.Type) -> K.Value where K: InjectionKey {
        get { key.currentValue }
        set { key.currentValue = newValue }
    }

    /// A static subscript accessor for updating and references dependencies directly. Usage:
    public static subscript<T>(_ keyPath: WritableKeyPath<InjectedValues, T>) -> T {
        get { current[keyPath: keyPath] }
        set { current[keyPath: keyPath] = newValue }
    }
}

public protocol InjectionKey {
    /// The associated type representing the type of the dependency injection key's value.
    associatedtype Value

    /// The default value for the dependency injection key.
    static var currentValue: Self.Value { get set }
}
