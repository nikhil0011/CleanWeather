//
//  ForecastListingUseCase.swift
//  CleanWeather
//
//  Created by Nikhil Nangia on 12/03/22.
//

import Foundation
protocol ForecastListingUseCaseOutput {
    func didFetch(data: ForecastData)
    func didSetError(error: GenericResponse)
}
enum DataSource {
    case local, remote
}
final class ForecastListingUseCase {
    let output: ForecastListingUseCaseOutput
    let dbManager: ForecastManager
    let dataSource: DataSource
    init(output: ForecastListingUseCaseOutput, source: DataSource, dbManager: ForecastManager = ForecastManager()) {
        self.output = output
        self.dataSource = source
        self.dbManager = dbManager
    }
    func fetch(location: String) {
        switch dataSource {
        case .local:
            fetchLocalDB(location)
            break
        case .remote:
            getForecastFor(location)
            break
        }
    }
    func getForecastFor(_ location: String) {
        Network.forecast(location: location) { (results) in
            switch results {
            case .success(let data):
                self.dbManager.append(forecast: data)
                self.output.didFetch(data: data)
            case .failure(let error):
                self.output.didSetError(error: error)
            }
        }
    }
    func fetchLocalDB(_ location: String) {
        if let item = self.dbManager.fetchForecast(for: location) {
            self.output.didFetch(data: item)
        }
    }
}
