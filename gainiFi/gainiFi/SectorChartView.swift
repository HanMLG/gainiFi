//
//  PieChartView.swift
//  gainiFi
//
//  Created by Anderson Sprenger on 17/05/24.
//

import SwiftUI
import Charts

struct Product: Identifiable {
    let id = UUID()
    let title: String
    let revenue: Double
}

struct SectorChartView: View {
    @State private var products: [Product] = [
        .init(title: "Student Loans", revenue: 0.55),
        .init(title: "Car Loans", revenue: 0.2),
        .init(title: "Mortage", revenue: 0.15),
        .init(title: "Personal Loans", revenue: 0.15),
        .init(title: "Credit Card", revenue: 0.05),
    ]
    
    var body: some View {
        Chart(products) { product in
            SectorMark(
                angle: .value(
                    Text(verbatim: product.title),
                    product.revenue
                )
            )
            .foregroundStyle(
                by: .value(
                    Text(verbatim: product.title),
                    product.title
                )
            )
        }
        .chartForegroundStyleScale([
            "Student Loans": .blue, "Car Loans": .red, "Mortage": .yellow, "Personal Loans": .orange, "Credit Card": .purple
        ])
        .chartLegend(position: .trailing, alignment: .bottom)
    }
}

#Preview {
    SectorChartView()
}
