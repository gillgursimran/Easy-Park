//
//  StringUtility.swift
//  EasyPark
//
//  Created by Gursimran Singh Gill on 2023-07-21.
//

import SwiftUI

public class StringUtils {
    public static func isEmpty(_ str: String?) -> Bool {
        return str == nil || str!.isEmpty || str!.trimmingCharacters(in: .whitespaces).isEmpty
    }

    public static func isNotEmpty(_ str: String?) -> Bool {
        return !isEmpty(str)
    }

    public static func mapDictionaryToString(
        _ dic: KeyValuePairs<String, String>,
        joinSeparator: String = "&"
    ) -> String {
        return dic.map { $0.0 + "=" + $0.1 }.joined(separator: joinSeparator)
    }

    public static func uuid() -> String {
        return UUID().uuidString.lowercased()
    }

    public static func commaDelimitedString(_ strings: [String]) -> String {
        return strings.filter { $0.isNotEmpty }.joined(separator: ", ")
    }
    
    public static func emailPredicate() -> NSPredicate {
        return NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
    }
}
