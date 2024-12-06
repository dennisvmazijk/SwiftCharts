//
//  ProductData.swift
//  SwiftCharts
//
//  Created by Dennis van Mazijk on 2024/12/06.
//

import SwiftUI

struct Product: Identifiable {
    var id = UUID()
    let name: String
    let price: Double
    let color: Color

    static let products: [Product] = [
        .init(name: "おにぎり", price: 150, color: .blue),
        .init(name: "揚げパン", price: 230, color: .red),
        .init(name: "サラダ", price: 375, color: .green),
        .init(name: "春巻き", price: 80, color: .orange)
    ]
}
