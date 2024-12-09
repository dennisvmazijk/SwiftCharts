//
//  ProductData.swift
//  SwiftCharts
//
//  Created by Dennis van Mazijk on 2024/12/06.
//

import SwiftUI
import Charts

struct Product: Identifiable {
    var id = UUID()
    let name: String
    let price: Double
    let color: Color
}

enum PriceType: String, Plottable {
    case regular = "普段"
    case discount = "割引"
}

struct ProductWithPriceType: Identifiable {
    var id = UUID()
    let name: String
    let price: Double
    let priceType: PriceType
    let sold: Int
}
