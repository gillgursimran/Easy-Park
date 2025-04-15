//
//  MobileLibLogger.swift
//  Core
//
//  Created by Gursimran Singh Gill on 2023-10-04.
//

import Foundation

public class MobileLibLogger: Logger {
    public override init(_ loggingClass: Any, writeToFile: Bool = true) {
        super.init(loggingClass, prefix: "Lib", writeToFile: writeToFile)
    }
}
