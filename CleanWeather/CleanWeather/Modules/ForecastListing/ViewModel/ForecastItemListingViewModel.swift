//
//  ForecastItemListingViewModel.swift
//  CleanWeather
//
//  Created by Nikhil Nangia on 12/03/22.
//

import UIKit
class ForecastItemListingViewModel {
    let title: String
    let subtitle: String
    let tempRange: String
    init(day: Forecastday) {
        self.title = day.date
        self.subtitle = "UV- \(day.day.uv)"
        self.tempRange = "\(day.day.mintempC)°C   - \(day.day.maxtempC)°C"
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
