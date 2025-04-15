//
//  Logger.swift
//  Core
//
//  Created by Gursimran Singh Gill on 2023-10-04.
//

import Foundation

import Foundation

open class Logger {
//    @Injected(\.preferences) private var preferences: Preferences
//    @Injected(\.logFileManager) private var logFileManager: LogFileManager

    private enum Level: String {
        case warning = "W"
        case debug = "D"
        case error = "E"
    }

    private let tag: String
    private let writeToFile: Bool

    public init(_ loggingClass: Any, writeToFile: Bool = true) {
        tag = "FC-\(String(describing: loggingClass.self))"
        self.writeToFile = writeToFile
    }

    public init(_ loggingClass: Any, prefix: String, writeToFile: Bool = true) {
        tag = "\(prefix)-\(String(describing: loggingClass.self))"
        self.writeToFile = writeToFile
    }

    public func w(_ msg: String) {
        printLog(.warning, msg)
    }

    public func d(_ msg: String) {
        printLog(.debug, msg)
    }

    public func e(_ msg: String) {
        printLog(.error, msg)
    }

    private func printLog(_ level: Level, _ msg: String) {
        let format = "".appendingFormat("\(level.rawValue)/\(tag): %@", msg)
        NSLog(format)
//        Crashlytics.log(format)
//        if !preferences.isProductionEnvironment() && writeToFile {
//            logFileManager.updateLogs(format)
//        }
    }
}
