//
//  ColorExtension.swift
//  EasyPark
//
//  Created by Gursimran Singh Gill on 2023-07-21.
//

import Foundation
import SwiftUI

public extension Color {
    static func rgb(_ red: Int, _ green: Int, _ blue: Int) -> Color {
        return Color(red: Double(red) / 255.0, green: Double(green) / 255.0, blue: Double(blue) / 255.0)
    }
}
