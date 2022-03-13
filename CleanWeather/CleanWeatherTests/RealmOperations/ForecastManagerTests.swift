//
//  ForecastManagerTests.swift
//  CleanWeatherTests
//
//  Created by Nikhil Nangia on 13/03/22.
//

import XCTest
@testable import CleanWeather
class ForecastManagerTests: XCTestCase {

    func testIfItemAppends() {
        let manager = ForecastManager()
        manager.clearAll()
        let data = ForecastData(location: Location(name: "d", region: "", country: "", lat: 0.0, lon: 0.0), current: Current(lastUpdated: "", tempC: 0.0, tempF: 0.0, isDay: 0, feelslikeC: 0.0, feelslikeF: 0.0), forecast: Forecast(forecastday: []))

        manager.append(forecast: data)
        let count = manager.fetchForecastList()?.count ?? 0
        XCTAssertEqual(1, count)
    }
    func testIfNoDuplicateItemAppends() {
        let manager = ForecastManager()
        manager.clearAll()
        let item = ForecastData(location: Location(name: "d", region: "", country: "", lat: 0.0, lon: 0.0), current: Current(lastUpdated: "", tempC: 0.0, tempF: 0.0, isDay: 0, feelslikeC: 0.0, feelslikeF: 0.0), forecast: Forecast(forecastday: []))

        manager.append(forecast: item)
        manager.append(forecast: item)
        manager.append(forecast: item)
        manager.append(forecast: item)
        manager.append(forecast: item)
        manager.append(forecast: item)
        manager.append(forecast: item)
        let count = manager.fetchForecastList()?.count ?? 0
        XCTAssertEqual(1, count)
    }
    func testIfFetchItemReturnCorrectObject() {
        let manager = ForecastManager()
        let data = ForecastData(location: Location(name: "dubai", region: "", country: "", lat: 0.0, lon: 0.0), current: Current(lastUpdated: "", tempC: 0.0, tempF: 0.0, isDay: 0, feelslikeC: 0.0, feelslikeF: 0.0), forecast: Forecast(forecastday: []))
        manager.append(forecast: data)
        let result = manager.fetchForecast(for: "dubai")
        XCTAssertEqual(data.location.name, result?.location.name)
    }
    func testIfClearAllDeleteAllItem() {
        let manager = ForecastManager()
        let data = ForecastData(location: Location(name: "dubai", region: "", country: "", lat: 0.0, lon: 0.0), current: Current(lastUpdated: "", tempC: 0.0, tempF: 0.0, isDay: 0, feelslikeC: 0.0, feelslikeF: 0.0), forecast: Forecast(forecastday: []))
        manager.append(forecast: data)
        manager.append(forecast: data)
        manager.append(forecast: data)
        manager.clearAll()
        let result = manager.fetchForecastList()
        XCTAssertEqual(result?.count, 0)
    }
}
