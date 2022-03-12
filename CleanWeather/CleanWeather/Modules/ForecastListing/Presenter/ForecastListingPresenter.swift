//
//  ForecastListingPresenter.swift
//  CleanWeather
//
//  Created by Nikhil Nangia on 12/03/22.
//

import Foundation


protocol ForecastListingPresenterOutput {
    func showForecast(viewModel: ForecastListingViewModel)
    func showError(error: GenericResponse)

}
final class ForecastListingPresenter: ForecastListingUseCaseOutput {
    let output: ForecastListingPresenterOutput
    init(output: ForecastListingPresenterOutput) {
        self.output = output
    }
    
    func didFetch(data: ForecastData) {
        output.showForecast(viewModel: ForecastListingViewModel(data: data))
    }
    func didSetError(error: GenericResponse) {
        output.showError(error: error)
    }
}
