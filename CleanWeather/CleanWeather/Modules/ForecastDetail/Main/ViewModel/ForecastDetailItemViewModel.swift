//
//  ForecastDetailItemViewModel.swift
//  CleanWeather
//
//  Created by Nikhil Nangia on 13/03/22.
//

import UIKit

class ForecastDetailItemViewModel {
    var currentTemp: String {
        let temp = currentTempInCelsuis ? hour.tempC : hour.tempF
        return "\(temp)\(currentUnit)"
    }
    var time: String {
        returnFormatted(hour.time)
    }
    var currentTempInCelsuis: Bool {
        NSConstantMethods.instance.currentTempUnitIsCelsuis
    }
    var currentUnit: String {
        currentTempInCelsuis ? DegreeCelsuis : DegreeFarhenite
    }
    private let hour: Hour
    init(hour: Hour) {
        self.hour = hour
    }
    var itemHeight: CGFloat {
        120
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
    func returnFormatted(_ time: String) -> String {
        let hourString = Array(hour.time.split(separator: " ").map {
            String($0)
        })
        guard hourString.count > 1 else {
            return ""
        }
        let hour = hourString[1].split(separator: ":")
        guard hour.count > 0, let time = Int(hour[0]), time < 12 else {
            return "\(hourString[1]) pm"
        }
        return "\(hourString[1]) am"
    }
}
