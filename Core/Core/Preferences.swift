//
//  Preferences.swift
//  Core
//
//  Created by Gursimran Singh Gill on 2024-03-05.
//

import Foundation

public class Preferences {
    private static let userInfo = "userInfo"
    private static let userLoggedIn = "userLoggedIn"
    
    private let log = MobileLibLogger(Preferences.self)
    private let defaults = UserDefaults.standard
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    public init() {
        
    }
    
    public func setUserInfo(_ userInfo: UserInfo) {
        guard let encodedUser = try? encoder.encode(userInfo) else {
            log.e("Failed to save to preferences.")
            return
        }
        defaults.set(encodedUser, forKey: Preferences.userInfo)
        setUserLoggedInState(true)
    }
    
    public func userInfo() -> UserInfo? {
        guard let savedUserData = defaults.object(forKey: Preferences.userInfo) as? Data else {
            log.d("Failed to retrieve user.")
            return nil
        }
        guard let savedUser = try? decoder.decode(UserInfo.self, from: savedUserData) else {
            log.d("Failed to decode user data.")
            return nil
        }
        log.d("User retrieved successfully: \(savedUser)")
        return savedUser
    }
    
    public func clearUserInfo() {
        defaults.removeObject(forKey: Preferences.userInfo)
        setUserLoggedInState(false)
    }
    
    public func userId() -> String? {
        guard let userInfo = userInfo() else {
            return nil
        }
        return userInfo.id ?? nil
    }
    
    public func userEmail() -> String? {
        guard let userInfo = userInfo() else {
            return nil
        }
        return userInfo.email ?? nil
    }
    
    public func setUserLoggedInState(_ isLoggedIn: Bool) {
        defaults.set(isLoggedIn, forKey: Preferences.userLoggedIn)
    }
    
    public func userLoggedInState() -> Bool {
        return defaults.bool(forKey: Preferences.userLoggedIn)
    }
}

public struct UserInfo: Codable {
    let email: String?
    let id: String?
    
    public init(email: String?, id: String?) {
        self.email = email
        self.id = id
    }
}
