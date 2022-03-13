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
    let date: String
    let uvValue: String
    var tempRange: String {
        let minTemp = currentTempInCelsuis ? day.day.mintempC : day.day.mintempF
        let maxTemp = currentTempInCelsuis ? day.day.maxtempC : day.day.maxtempF
        return "\(minTemp)\(currentUnit) - \(maxTemp)\(currentUnit)"
    }
    let day: Forecastday
    var currentTempInCelsuis: Bool {
        NSConstantMethods.instance.currentTempUnitIsCelsuis
    }
    var currentUnit: String {
        currentTempInCelsuis ? DegreeCelsuis : DegreeFarhenite
    }
    
    init(day: Forecastday) {
        self.day = day
        self.date = day.date
        self.uvValue = "UV- \(day.day.uv)"
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
