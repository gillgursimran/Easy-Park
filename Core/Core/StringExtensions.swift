//
//  StringExtensions.swift
//  EasyPark
//
//  Created by Gursimran Singh Gill on 2023-07-21.
//

import Foundation

public extension String {
    var isNotEmpty: Bool {
        return !isEmpty
    }

    func localized(_ bundle: Bundle, tableName: String = "Localizable") -> String {
        return NSLocalizedString(
            self,
            tableName: tableName,
            bundle: bundle,
            value: "\(self)",
            comment: ""
        )
    }

    /// Adds applicable padding to ensure self is a valid Base64 string. iOS unfortunately doesn't automatically add
    /// this padding like Android does.
    func decodeBase64() -> Data? {
        var validString = self
        let remainder = self.count % 4
        if remainder > 0 {
            validString = self.padding(
                toLength: self.count + 4 - remainder,
                withPad: "=",
                startingAt: 0
            )
        }
        return Data(base64Encoded: validString, options: .ignoreUnknownCharacters)
    }

    func dataUTF8() -> Data {
        return self.data(using: .utf8)!
    }

    func getFormattedString(_ args: [CVarArg]) -> String {
        return String(format: self, arguments: args)
    }

    func truncateMultipleCommas() -> String {
        return self.replacingOccurrences(of: "\\,,", with: ",", options: .regularExpression)
    }

    func trunc(to length: Int) -> String {
        return count > length ? String(substring(to: index(startIndex, offsetBy: length))) : self
    }

    var isValidEmail: Bool {
        let mailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return matches(mailRegex)
    }

    func matches(_ regex: String) -> Bool {
        return range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }

    func isValidUrl() -> Bool {
        guard let detector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue) else {
            return false
        }
        if let match = detector.firstMatch(
            in: self,
            options: [],
            range: NSRange(location: 0, length: self.utf16.count)
        ) {
            // it is a link, if the match covers the whole string
            return match.range.length == self.utf16.count
        } else {
            return false
        }
    }
}
