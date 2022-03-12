//
//  ForecastHeaderViewModel.swift
//  CleanWeather
//
//  Created by Nikhil Nangia on 13/03/22.
//

import Foundation
class ForecastHeaderViewModel {
    private let current: Current
    let regionLabel: String
    let latlongLabel: String
    let lastUpdatedLabel: String
    var feelsLikeLabel: String {
        let temp = currentTempInCelsuis ? current.feelslikeC : current.feelslikeF
        return "Feels like: \(temp) \(currentUnit)"
    }
    var tempLabel: String {
        let temp = currentTempInCelsuis ? current.tempC : current.tempF
        return "Current Temp: \(temp) \(currentUnit)"
    }
    private let isDay: Int
    var isDayValue: String {
        isDay == 1 ? "Day Time" : "Night Time"
    }
   
    var currentTempInCelsuis: Bool {
        NSConstantMethods.instance.currentTempUnitIsCelsuis
    }
    var currentUnit: String {
        currentTempInCelsuis ? DegreeCelsuis : DegreeFarhenite
    }

    init(data: HeaderData) {
        self.current = data.0
        self.isDay = data.0.isDay
        self.lastUpdatedLabel = "Last updated at \(data.0.lastUpdated)"
        self.regionLabel = "Weather in \(data.1.name), \(data.1.region), \(data.1.country)"
        self.latlongLabel = "Current location coordinates are \(data.1.lat), \(data.1.lon)"
    }
}
