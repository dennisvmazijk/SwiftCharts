//
//  BarChartView.swift
//  SwiftCharts
//
//  Created by Dennis van Mazijk on 2024/12/06.
//

import SwiftUI
import Charts

struct BarChartView: View {
    private let products: [Product] = [
        .init(name: "おにぎり", price: 150, color: .blue),
        .init(name: "おにぎり", price: 150, color: .yellow),
        .init(name: "揚げパン", price: 230, color: .red),
        .init(name: "サラダ", price: 375, color: .green),
        .init(name: "春巻き", price: 80, color: .orange)
    ]

    var body: some View {
        Chart(products) { product in
            BarMark(
                x: .value("商品", product.name),
                y: .value("値段", product.price)
            )
            .foregroundStyle(product.color)
            .annotation(position: .overlay) {
                Text("¥\(product.price, format: .number.precision(.fractionLength(0)))")
                    .foregroundColor(.white)
                    .font(.system(size: 12))
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

struct BarChartGroupedView: View {
    private let products: [ProductWithPriceType] = [
        .init(name: "おにぎり", price: 150, priceType: .regular, sold: 10),
        .init(name: "おにぎり", price: 100, priceType: .discount, sold: 25),
        .init(name: "揚げパン", price: 230, priceType: .regular, sold: 4),
        .init(name: "揚げパン", price: 210, priceType: .discount, sold: 16),
        .init(name: "サラダ", price: 375, priceType: .regular, sold: 2),
        .init(name: "サラダ", price: 325, priceType: .discount, sold: 4),
        .init(name: "春巻き", price: 85, priceType: .regular, sold: 17),
        .init(name: "春巻き", price: 80, priceType: .discount, sold: 20)
    ]

    @State private var soldTotal: [UUID: Int] = [:]

    var body: some View {
        VStack {
            Text("販売数")
                .font(.headline)

            Chart {
                ForEach(products) { product in
                    BarMark(
                        x: .value("商品", product.name),
                        y: .value("販売数", soldTotal[product.id] ?? 0)
                    )
                    .foregroundStyle(product.priceType == .regular ? .red : .blue)
                    .position(by: .value("Type", product.priceType))
                    .annotation(position: .top) {
                        Text("¥\(product.price, format: .number.precision(.fractionLength(0)))")
                            .foregroundColor(.gray)
                            .font(.system(size: 12))
                    }
                }
            }
            .frame(height: 450)
            .padding()
            .chartForegroundStyleScale([
                "普段": .red,
                "割引": .blue
            ])
            .chartYScale(domain: [0, 30])
            .onAppear {
                withAnimation(.easeInOut(duration: 0.3)) {
                    soldTotal = products.reduce(into: [:]) {
                        $0[$1.id] = $1.sold
                    }
                }
            }
        }
    }
}

#Preview {
    BarChartView()
}
