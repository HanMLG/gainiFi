//
//  Mock.swift
//  gainiFi
//
//  Created by Anderson Sprenger on 17/05/24.
//

import Foundation

enum Constants {
    static let previewChartHeight: CGFloat = 100
    static let detailChartHeight: CGFloat = 300
}

/// Data for the daily and monthly sales charts.
enum SalesData {
    /// Sales by day for the last 30 days.
    static let last30Days: [Sale] = [
        Sale(day: date(year: 2022, month: 5, day: 8), sales: 168),
        Sale(day: date(year: 2022, month: 5, day: 9), sales: 117),
        Sale(day: date(year: 2022, month: 5, day: 10), sales: 106),
        Sale(day: date(year: 2022, month: 5, day: 11), sales: 119),
        Sale(day: date(year: 2022, month: 5, day: 12), sales: 109),
        Sale(day: date(year: 2022, month: 5, day: 13), sales: 104),
        Sale(day: date(year: 2022, month: 5, day: 14), sales: 196),
        Sale(day: date(year: 2022, month: 5, day: 15), sales: 172),
        Sale(day: date(year: 2022, month: 5, day: 16), sales: 122),
        Sale(day: date(year: 2022, month: 5, day: 17), sales: 115),
        Sale(day: date(year: 2022, month: 5, day: 18), sales: 138),
        Sale(day: date(year: 2022, month: 5, day: 19), sales: 110),
        Sale(day: date(year: 2022, month: 5, day: 20), sales: 106),
        Sale(day: date(year: 2022, month: 5, day: 21), sales: 187),
        Sale(day: date(year: 2022, month: 5, day: 22), sales: 187),
        Sale(day: date(year: 2022, month: 5, day: 23), sales: 119),
        Sale(day: date(year: 2022, month: 5, day: 24), sales: 160),
        Sale(day: date(year: 2022, month: 5, day: 25), sales: 144),
        Sale(day: date(year: 2022, month: 5, day: 26), sales: 152),
        Sale(day: date(year: 2022, month: 5, day: 27), sales: 148),
        Sale(day: date(year: 2022, month: 5, day: 28), sales: 240),
        Sale(day: date(year: 2022, month: 5, day: 29), sales: 242),
        Sale(day: date(year: 2022, month: 5, day: 30), sales: 173),
        Sale(day: date(year: 2022, month: 5, day: 31), sales: 143),
        Sale(day: date(year: 2022, month: 6, day: 1), sales: 137),
        Sale(day: date(year: 2022, month: 6, day: 2), sales: 123),
        Sale(day: date(year: 2022, month: 6, day: 3), sales: 146),
        Sale(day: date(year: 2022, month: 6, day: 4), sales: 214),
        Sale(day: date(year: 2022, month: 6, day: 5), sales: 250),
        Sale(day: date(year: 2022, month: 6, day: 6), sales: 146)
    ]

    /// Total sales for the last 30 days.
    static var last30DaysTotal: Int {
        last30Days.reduce(0) { $0 + $1.sales }
    }

    /// Average sales per day for the last 30 days.
    static var last30DaysAverage: Double {
        Double(last30DaysTotal) / Double(last30Days.count)
    }

    /// Sales by month for the last 12 months.
    static let last12Months: [MonthlySales] = [
        MonthlySales(month: date(year: 2021, month: 7), sales: 3952, dailyAverage: 127, dailyMin: 95, dailyMax: 194),
        MonthlySales(month: date(year: 2021, month: 8), sales: 4044, dailyAverage: 130, dailyMin: 96, dailyMax: 189),
        MonthlySales(month: date(year: 2021, month: 9), sales: 3930, dailyAverage: 131, dailyMin: 101, dailyMax: 184),
        MonthlySales(month: date(year: 2021, month: 10), sales: 4217, dailyAverage: 136, dailyMin: 96, dailyMax: 193),
        MonthlySales(month: date(year: 2021, month: 11), sales: 4006, dailyAverage: 134, dailyMin: 104, dailyMax: 202),
        MonthlySales(month: date(year: 2021, month: 12), sales: 3994, dailyAverage: 129, dailyMin: 96, dailyMax: 190),
        MonthlySales(month: date(year: 2022, month: 1), sales: 4202, dailyAverage: 136, dailyMin: 96, dailyMax: 203),
        MonthlySales(month: date(year: 2022, month: 2), sales: 3749, dailyAverage: 134, dailyMin: 98, dailyMax: 200),
        MonthlySales(month: date(year: 2022, month: 3), sales: 4329, dailyAverage: 140, dailyMin: 104, dailyMax: 218),
        MonthlySales(month: date(year: 2022, month: 4), sales: 4084, dailyAverage: 136, dailyMin: 93, dailyMax: 221),
        MonthlySales(month: date(year: 2022, month: 5), sales: 4559, dailyAverage: 147, dailyMin: 104, dailyMax: 242),
        MonthlySales(month: date(year: 2022, month: 6), sales: 1023, dailyAverage: 170, dailyMin: 120, dailyMax: 250)
    ]

    /// Total sales for the last 12 months.
    static var last12MonthsTotal: Int {
        last12Months.reduce(0) { $0 + $1.sales }
    }

    /// Average daily sales for the last 12 months.
    static var last12MonthsDailyAverage: Int {
        last12Months.reduce(0) { $0 + $1.dailyAverage } / last12Months.count
    }
}

/// Struct representing a sale record.
struct Sale: Equatable {
    let day: Date
    var sales: Int
}

extension Sale {
    func isAbove(threshold: Double) -> Bool {
        self.sales > Int(threshold)
    }
}

/// Struct representing monthly sales data.
struct MonthlySales: Equatable {
    let month: Date
    var sales: Int
    var dailyAverage: Int
    var dailyMin: Int
    var dailyMax: Int
}

/// Helper function to create a date.
func date(year: Int, month: Int, day: Int = 1) -> Date {
    let components = DateComponents(year: year, month: month, day: day)
    return Calendar.current.date(from: components)!
}

enum LocationData {
    /// A data series for the lines.
    struct Series: Identifiable {
        /// The name of the city.
        let city: String

        /// Average daily sales for each weekday.
        /// The `weekday` property is a `Date` that represents a weekday.
        let sales: [(weekday: Date, sales: Int)]

        /// The identifier for the series.
        var id: String { city }
    }
    
    /// Sales by location and weekday for the last 7 days.
    static let last7Days: [Series] = [
        .init(city: "Cupertino", sales: [
            (weekday: date(year: 2022, month: 5, day: 1), sales: 54),
            (weekday: date(year: 2022, month: 5, day: 2), sales: 42),
            (weekday: date(year: 2022, month: 5, day: 3), sales: 88),
            (weekday: date(year: 2022, month: 5, day: 4), sales: 49),
            (weekday: date(year: 2022, month: 5, day: 5), sales: 42),
            (weekday: date(year: 2022, month: 5, day: 6), sales: 61),
            (weekday: date(year: 2022, month: 5, day: 7), sales: 67)
        ]),
        .init(city: "San Francisco", sales: [
            (weekday: date(year: 2022, month: 5, day: 1), sales: 81),
            (weekday: date(year: 2022, month: 5, day: 2), sales: 90),
            (weekday: date(year: 2022, month: 5, day: 3), sales: 52),
            (weekday: date(year: 2022, month: 5, day: 4), sales: 72),
            (weekday: date(year: 2022, month: 5, day: 5), sales: 84),
            (weekday: date(year: 2022, month: 5, day: 6), sales: 84),
            (weekday: date(year: 2022, month: 5, day: 7), sales: 137)
        ])
    ]

    /// Sales by location and weekday for the last 30 days.
    static let last30Days: [Series] = [
        .init(city: "Cupertino", sales: [
            (weekday: date(year: 2022, month: 5, day: 1), sales: 54),
            (weekday: date(year: 2022, month: 5, day: 2), sales: 42),
            (weekday: date(year: 2022, month: 5, day: 3), sales: 88),
            (weekday: date(year: 2022, month: 5, day: 4), sales: 49),
            (weekday: date(year: 2022, month: 5, day: 5), sales: 42),
            (weekday: date(year: 2022, month: 5, day: 6), sales: 61),
            (weekday: date(year: 2022, month: 5, day: 7), sales: 67),
            (weekday: date(year: 2022, month: 5, day: 8), sales: 54),
            (weekday: date(year: 2022, month: 5, day: 9), sales: 47),
            (weekday: date(year: 2022, month: 5, day: 10), sales: 42),
            (weekday: date(year: 2022, month: 5, day: 11), sales: 71),
            (weekday: date(year: 2022, month: 5, day: 12), sales: 56),
            (weekday: date(year: 2022, month: 5, day: 13), sales: 81),
            (weekday: date(year: 2022, month: 5, day: 14), sales: 40),
            (weekday: date(year: 2022, month: 5, day: 15), sales: 49),
            (weekday: date(year: 2022, month: 5, day: 16), sales: 42),
            (weekday: date(year: 2022, month: 5, day: 17), sales: 58),
            (weekday: date(year: 2022, month: 5, day: 18), sales: 66),
            (weekday: date(year: 2022, month: 5, day: 19), sales: 62),
            (weekday: date(year: 2022, month: 5, day: 20), sales: 77),
            (weekday: date(year: 2022, month: 5, day: 21), sales: 55),
            (weekday: date(year: 2022, month: 5, day: 22), sales: 52),
            (weekday: date(year: 2022, month: 5, day: 23), sales: 42),
            (weekday: date(year: 2022, month: 5, day: 24), sales: 49),
            (weekday: date(year: 2022, month: 5, day: 25), sales: 58),
            (weekday: date(year: 2022, month: 5, day: 26), sales: 61),
            (weekday: date(year: 2022, month: 5, day: 27), sales: 68),
            (weekday: date(year: 2022, month: 5, day: 28), sales: 43),
            (weekday: date(year: 2022, month: 5, day: 29), sales: 49),
            (weekday: date(year: 2022, month: 5, day: 30), sales: 125)
        ]),
        .init(city: "San Francisco", sales: [
            (weekday: date(year: 2022, month: 5, day: 1), sales: 81),
            (weekday: date(year: 2022, month: 5, day: 2), sales: 90),
            (weekday: date(year: 2022, month: 5, day: 3), sales: 52),
            (weekday: date(year: 2022, month: 5, day: 4), sales: 72),
            (weekday: date(year: 2022, month: 5, day: 5), sales: 84),
            (weekday: date(year: 2022, month: 5, day: 6), sales: 84),
            (weekday: date(year: 2022, month: 5, day: 7), sales: 137),
            (weekday: date(year: 2022, month: 5, day: 8), sales: 99),
            (weekday: date(year: 2022, month: 5, day: 9), sales: 81),
            (weekday: date(year: 2022, month: 5, day: 10), sales: 52),
            (weekday: date(year: 2022, month: 5, day: 11), sales: 66),
            (weekday: date(year: 2022, month: 5, day: 12), sales: 84),
            (weekday: date(year: 2022, month: 5, day: 13), sales: 84),
            (weekday: date(year: 2022, month: 5, day: 14), sales: 122),
            (weekday: date(year: 2022, month: 5, day: 15), sales: 147),
            (weekday: date(year: 2022, month: 5, day: 16), sales: 66),
            (weekday: date(year: 2022, month: 5, day: 17), sales: 72),
            (weekday: date(year: 2022, month: 5, day: 18), sales: 62),
            (weekday: date(year: 2022, month: 5, day: 19), sales: 55),
            (weekday: date(year: 2022, month: 5, day: 20), sales: 84),
            (weekday: date(year: 2022, month: 5, day: 21), sales: 122),
            (weekday: date(year: 2022, month: 5, day: 22), sales: 81),
            (weekday: date(year: 2022, month: 5, day: 23), sales: 95),
            (weekday: date(year: 2022, month: 5, day: 24), sales: 63),
            (weekday: date(year: 2022, month: 5, day: 25), sales: 72),
            (weekday: date(year: 2022, month: 5, day: 26), sales: 74),
            (weekday: date(year: 2022, month: 5, day: 27), sales: 79),
            (weekday: date(year: 2022, month: 5, day: 28), sales: 93),
            (weekday: date(year: 2022, month: 5, day: 29), sales: 84),
            (weekday: date(year: 2022, month: 5, day: 30), sales: 87)
        ])
    ]

    /// The best weekday and location for the last 30 days.
    static let last30DaysBest = (
        city: "San Francisco",
        weekday: date(year: 2022, month: 5, day: 8),
        sales: 137
    )

    /// The best weekday and location for the last 12 months.
    static let last12MonthsBest = (
        city: "San Francisco",
        weekday: date(year: 2022, month: 5, day: 8),
        sales: 113
    )

    /// Sales by location and weekday for the last 12 months.
    static let last12Months: [Series] = [
        .init(city: "Cupertino", sales: [
            (weekday: date(year: 2022, month: 5, day: 2), sales: 64),
            (weekday: date(year: 2022, month: 5, day: 3), sales: 60),
            (weekday: date(year: 2022, month: 5, day: 4), sales: 47),
            (weekday: date(year: 2022, month: 5, day: 5), sales: 55),
            (weekday: date(year: 2022, month: 5, day: 6), sales: 55),
            (weekday: date(year: 2022, month: 5, day: 7), sales: 105),
            (weekday: date(year: 2022, month: 5, day: 8), sales: 67)
        ]),
        .init(city: "San Francisco", sales: [
            (weekday: date(year: 2022, month: 5, day: 2), sales: 57),
            (weekday: date(year: 2022, month: 5, day: 3), sales: 56),
            (weekday: date(year: 2022, month: 5, day: 4), sales: 66),
            (weekday: date(year: 2022, month: 5, day: 5), sales: 61),
            (weekday: date(year: 2022, month: 5, day: 6), sales: 60),
            (weekday: date(year: 2022, month: 5, day: 7), sales: 77),
            (weekday: date(year: 2022, month: 5, day: 8), sales: 113)
        ])
    ]
}
