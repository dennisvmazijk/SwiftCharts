//
//  LineChartView.swift
//  SwiftCharts
//
//  Created by Dennis van Mazijk on 2024/12/06.
//

import SwiftUI
import Charts

struct LineChartView: View {
    private let data: [Sales] = [
        .init(day: "月曜日", sales: 1000, timeOfDay: .day),
        .init(day: "火曜日", sales: 1500, timeOfDay: .day),
        .init(day: "水曜日", sales: 750, timeOfDay: .day),
        .init(day: "木曜日", sales: 1000, timeOfDay: .day),
        .init(day: "金曜日", sales: 1500, timeOfDay: .day),
        .init(day: "月曜日", sales: 500, timeOfDay: .evening),
        .init(day: "火曜日", sales: 1000, timeOfDay: .evening),
        .init(day: "水曜日", sales: 500, timeOfDay: .evening),
        .init(day: "木曜日", sales: 1500, timeOfDay: .evening),
        .init(day: "金曜日", sales: 4000, timeOfDay: .evening)
    ]

    var body: some View {
        Chart(data) { data in
            LineMark(
                x: .value("曜日", data.day),
                y: .value("売上", data.sales)
            )
            .foregroundStyle(by: .value("timeOfDay", data.timeOfDay))
            .symbol(by: .value("timeOfDay", data.timeOfDay))
            .interpolationMethod(.cardinal)
        }
        .frame(height: 450)
        .padding()
        .chartYScale(domain: [0, 5000])
        .chartYAxis {
            AxisMarks(values: .automatic(desiredCount: 5))
        }
    }
}

#Preview {
    LineChartView()
}
