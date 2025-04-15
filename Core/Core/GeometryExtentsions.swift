//
//  GeometryExtentsions.swift
//  EasyPark
//
//  Created by Gursimran Singh Gill on 2023-08-15.
//

import SwiftUI

public extension GeometryProxy {
    func getWidth(numberOfItems: Double = 1, padding: Double = Dimens.spacingMedium) -> Double {
        return (Double(self.size.width) - ((numberOfItems + 1) * padding)) / numberOfItems
    }
}
