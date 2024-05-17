//
// Copyright © 2022 Swift Charts Examples.
// Open Source - MIT License

import SwiftUI
import Charts

struct LineChartView: View {
    var isOverview: Bool

    @State private var lineWidth = 2.0
    @State private var interpolationMethod: ChartInterpolationMethod = .cardinal
    @State private var chartColor: Color = .white
    @State private var showSymbols = true
    @State private var selectedElement: Sale? = nil
    @State private var showLollipop = true
    @State private var lollipopColor: Color = .white

    var data = SalesData.last30Days

    var body: some View {
        Chart(data, id: \.day) { chartMarker in
            let baselineMarker = getBaselineMarker(marker: chartMarker)
            if CompareSelectedMarkerToChartMarker(selectedMarker: selectedElement, chartMarker: chartMarker) && showLollipop {
                baselineMarker.symbol() {
                    Circle().strokeBorder(chartColor, lineWidth: 2).background(Circle().foregroundColor(lollipopColor)).frame(width: 11)
                }
            } else {
                baselineMarker.symbol(Circle().strokeBorder(lineWidth: lineWidth))
            }
        }
        .chartXAxis(isOverview ? .hidden : .automatic)
        .chartYAxis(isOverview ? .hidden : .automatic)
        .accessibilityChartDescriptor(self)
    }
  
  private func CompareSelectedMarkerToChartMarker<T: Equatable>(selectedMarker: T, chartMarker: T) -> Bool {
        return selectedMarker == chartMarker
    }

  private func getBaselineMarker (marker: Sale) -> some ChartContent {
      return LineMark(
          x: .value("Date", marker.day),
          y: .value("Sales", marker.sales)
      )
      .accessibilityLabel(marker.day.formatted(date: .complete, time: .omitted))
      .accessibilityValue("\(marker.sales) sold")
      .lineStyle(StrokeStyle(lineWidth: lineWidth))
      .foregroundStyle(chartColor)
      .interpolationMethod(interpolationMethod.mode)
      .symbolSize(showSymbols ? 60 : 0)
  }
  
    private func findElement(location: CGPoint, proxy: ChartProxy, geometry: GeometryProxy) -> Sale? {
        let relativeXPosition = location.x - geometry[proxy.plotAreaFrame].origin.x
        if let date = proxy.value(atX: relativeXPosition) as Date? {
            // Find the closest date element.
            var minDistance: TimeInterval = .infinity
            var index: Int? = nil
            for salesDataIndex in data.indices {
                let nthSalesDataDistance = data[salesDataIndex].day.distance(to: date)
                if abs(nthSalesDataDistance) < minDistance {
                    minDistance = abs(nthSalesDataDistance)
                    index = salesDataIndex
                }
            }
            if let index {
                return data[index]
            }
        }
        return nil
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
