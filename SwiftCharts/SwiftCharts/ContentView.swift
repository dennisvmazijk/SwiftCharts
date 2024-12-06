//
//  ContentView.swift
//  SwiftCharts
//
//  Created by Dennis van Mazijk on 2024/12/06.
//

import SwiftUI
import Charts

enum ChartType: String, CaseIterable {
    case bar
    case line
}

struct ContentView: View {
    @State private var selectedChart: ChartType = .bar

    var body: some View {
        NavigationStack {
            VStack {
                Picker("", selection: $selectedChart) {
                    ForEach(ChartType.allCases, id: \.self) { type in
                        Text(type.rawValue.capitalized).tag(type)
                    }
                }
                .pickerStyle(.segmented)

                Spacer()

                switch selectedChart {
                case .bar:
                    BarChartView()
                case .line:
                    LineChartView()
                }

                Spacer()
            }
            .navigationTitle("Swift Charts")
            .toolbarTitleDisplayMode(.inline)
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
