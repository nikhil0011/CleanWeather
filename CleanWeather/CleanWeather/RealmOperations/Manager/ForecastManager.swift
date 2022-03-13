//
//  ForecastManager.swift
//  CleanWeather
//
//  Created by Nikhil Nangia on 13/03/22.
//

import Foundation
import RealmSwift
struct ForecastManager {
    private let forecastDataRepository: ForecastDataRepository = ForecastDataRepository(realm: try? Realm())
    
    func append(forecast: FORECAST_ITEM) {
        guard fetchForecast(for: forecast.location.name) == nil else {
            _ = updateForecast(item: forecast)
            return
        }
        forecastDataRepository.create(forecast)
    }
    
    func fetchForecastList() -> [FORECAST_ITEM]? {
        return forecastDataRepository.getAll()
    }

    func fetchForecast(for name: String) -> FORECAST_ITEM?
    {
        return forecastDataRepository.get(by: name)
    }

    func updateForecast(item: FORECAST_ITEM) -> Bool {
        return forecastDataRepository.update(forecast: item)
    }

    func deleteForecast(name: String) -> Bool {
        return forecastDataRepository.delete(name: name)
    }
    func clearAll() {
        let items = fetchForecastList()
        items?.forEach {
            _ = deleteForecast(name: $0.location.name)
        }
    }
}
