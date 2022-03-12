//
//  ForecastItemListingViewModel.swift
//  CleanWeather
//
//  Created by Nikhil Nangia on 12/03/22.
//

import UIKit
typealias HeaderData = (Current, Location)
let DegreeCelsuis = "°C"
let DegreeFarhenite = "°F"
class ForecastItemListingViewModel {
    let title: String
    let subtitle: String
    let tempRange: String
//    lazy var currentUnit: String {
//        DegreeCelsuis
//    }
    init(day: Forecastday) {
        self.title = day.date
        self.subtitle = "UV- \(day.day.uv)"
        self.tempRange = "\(day.day.mintempC)\(DegreeCelsuis)   - \(day.day.maxtempC)\(DegreeCelsuis)"
    }
    var itemHeight: CGFloat {
        100
    }
    var itemInset: UIEdgeInsets {
        .init(top: 2, left: 2, bottom: 2, right: 2)
    }
    var interItemSpacing: CGFloat {
        4
    }
    var sectionInset: UIEdgeInsets {
        .init(top: 0, left: 16, bottom: 0, right: 16)
    }
}
class ForecastHeaderViewModel {
    let regionLabel: String
    let latlongLabel: String
    let lastUpdatedLabel: String
    let feelsLikeLabel: String
    let tempLabel: String
    var currentUnit: String {
        DegreeCelsuis
    }
    
    init(data: HeaderData) {
        self.lastUpdatedLabel = "Last updated at \(data.0.lastUpdated)"
        self.feelsLikeLabel = "Feels like: \(data.0.feelslikeC) \(DegreeCelsuis)"
        self.tempLabel = "Current Temp: \(data.0.tempC) \(DegreeCelsuis)"
        self.regionLabel = "Temp in \(data.1.name), \(data.1.region), \(data.1.country)"
        self.latlongLabel = "Current location coordinates are \(data.1.lat), \(data.1.lon)"
    }
}
