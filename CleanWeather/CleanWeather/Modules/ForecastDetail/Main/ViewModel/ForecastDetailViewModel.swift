//
//  ForecastDetailViewModel.swift
//  CleanWeather
//
//  Created by Nikhil Nangia on 12/03/22.
//

import Foundation
class ForecastDetailViewModel {
    let headerViewModel: ForecastHeaderViewModel
    let day: Forecastday
    init(day: Forecastday, _ headerVM: ForecastHeaderViewModel) {
        self.day = day
        self.headerViewModel = headerVM
    }
    func listOfItemVM() -> [ForecastDetailItemViewModel] {
        var itemViewModelList: [ForecastDetailItemViewModel] = [ForecastDetailItemViewModel]()
        day.hour.forEach {
            let itemViewModel = ForecastDetailItemViewModel(hour: $0)
            itemViewModelList.append(itemViewModel)
        }
        return itemViewModelList
    }
}
