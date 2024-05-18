//
// Copyright © 2022 Swift Charts Examples.
// Open Source - MIT License

import SwiftUI
import Charts

import SwiftUI
import Charts

struct LineChartView: View {
    var isOverview: Bool

    @State private var lineWidth = 2.0
    @State private var chartColor: Color = .white
    @State private var showSymbols = true
    @State private var interpolationMethod: ChartInterpolationMethod = .cardinal

    var data = SalesData.last30Days

    var body: some View {
        Chart(data, id: \.day) { chartMarker in
            LineMark(
                x: .value("Date", chartMarker.day),
                y: .value("Sales", chartMarker.sales)
            )
            .accessibilityLabel(chartMarker.day.formatted(date: .complete, time: .omitted))
            .accessibilityValue("\(chartMarker.sales) sold")
            .lineStyle(StrokeStyle(lineWidth: lineWidth))
            .foregroundStyle(chartColor)
            .interpolationMethod(interpolationMethod.mode)
            .symbol(Circle().strokeBorder(lineWidth: lineWidth))
            .symbolSize(showSymbols ? 60 : 0)
        }
        .chartXAxis(isOverview ? .hidden : .automatic)
        .chartYAxis(isOverview ? .hidden : .automatic)
        .accessibilityChartDescriptor(self)
    }
}

// MARK: - Accessibility

extension LineChartView: AXChartDescriptorRepresentable {
    func makeChartDescriptor() -> AXChartDescriptor {
        AccessibilityHelpers.chartDescriptor(forSalesSeries: data)
    }
}

// MARK: - Preview

#Preview {
    LineChartView(isOverview: true)
}
