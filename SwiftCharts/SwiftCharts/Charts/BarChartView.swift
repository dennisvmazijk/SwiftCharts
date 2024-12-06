//
//  BarChartView.swift
//  SwiftCharts
//
//  Created by Dennis van Mazijk on 2024/12/06.
//

import SwiftUI
import Charts

struct BarChartView: View {
    var body: some View {
        Chart(Product.products) { product in
            BarMark(
                x: .value("商品", product.name),
                y: .value("値段", product.price)
            )
            .foregroundStyle(product.color)
            .annotation(position: .overlay, alignment: .center) {
                Text("¥\(product.price, format: .number.precision(.fractionLength(0)))")
                    .foregroundColor(.white)
                    .font(.system(size: 13, weight: .bold))
            }
        }
        .frame(height: 450)
        .padding()
        .chartYScale(domain: [0, 500])
        .chartYAxis {
            AxisMarks(values: .automatic(desiredCount: 5))
        }
    }
}

#Preview {
    BarChartView()
}
