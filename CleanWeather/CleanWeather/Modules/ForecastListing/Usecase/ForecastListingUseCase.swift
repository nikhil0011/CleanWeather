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

final class ForecastListingUseCase {
    let output: ForecastListingUseCaseOutput
    init(output: ForecastListingUseCaseOutput) {
        self.output = output
    }
    func fetch(location: String) {
        Network.forecast(location: location) { (results) in
            switch results {
            case .success(let data):
                self.output.didFetch(data: data)
            case .failure(let error):
                self.output.didSetError(error: error)
            }
        }
    }
}
