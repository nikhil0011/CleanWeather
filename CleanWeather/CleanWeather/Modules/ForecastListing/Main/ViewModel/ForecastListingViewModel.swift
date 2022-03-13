//
//  ForecastListingViewModel.swift
//  CleanWeather
//
//  Created by Nikhil Nangia on 12/03/22.
//

import UIKit
struct ForecastListingViewModel {
    var title: String {
        data.location.name
    }
    private let data: ForecastData
    let headerData: HeaderData
    init(data: ForecastData) {
        self.data = data
        self.headerData = (data.current, data.location)
    }
    func listOfItemVM() -> [ForecastItemListingViewModel] {
        var itemViewModelList: [ForecastItemListingViewModel] = [ForecastItemListingViewModel]()
        data.forecast.forecastday.forEach {
            let itemViewModel = ForecastItemListingViewModel(day: $0)
            itemViewModelList.append(itemViewModel)
        }
        return itemViewModelList
    }
}
