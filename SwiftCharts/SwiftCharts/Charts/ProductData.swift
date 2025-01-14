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

struct Sales: Identifiable {
    var id = UUID()
    let day: String
    let sales: Int
    let timeOfDay: TimeOfDay
}

enum TimeOfDay: String, Plottable {
    case day = "昼間"
    case evening = "夕方"
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
