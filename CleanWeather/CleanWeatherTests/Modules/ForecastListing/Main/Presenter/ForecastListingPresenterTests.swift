//
//  ForecastListingPresenterTests.swift
//  CleanWeatherTests
//
//  Created by Nikhil Nangia on 13/03/22.
//

import XCTest
@testable import CleanWeather
class ForecastListingPresenterTests: XCTestCase {
    func testdidFetchPassesForecast() {
        let spy = OutputSpy()
        let presenter = ForecastListingPresenter(output: spy)
        XCTAssertEqual(spy.sections.count, 0)
        for _ in 1...10 {
            let data = ForecastData(location: Location(name: "d", region: "", country: "", lat: 0.0, lon: 0.0), current: Current(lastUpdated: "", tempC: 0.0, tempF: 0.0, isDay: 0, feelslikeC: 0.0, feelslikeF: 0.0), forecast: Forecast(forecastday: []))
            presenter.didFetch(data: data)
        }
        XCTAssertEqual(spy.sections.count, 10)

    }
    private class OutputSpy: ForecastListingPresenterOutput {
        typealias Meta = (ForecastListingViewModel)
        var sections: [Meta] = [Meta]()

        func showForecast(viewModel: ForecastListingViewModel) {
            sections.append(viewModel)
        }
        
        func showError(error: GenericResponse) {
        }
    }
}
