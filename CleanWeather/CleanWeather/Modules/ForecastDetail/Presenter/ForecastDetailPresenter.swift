//
//  ForecastDetailPresenter.swift
//  CleanWeather
//
//  Created by Nikhil Nangia on 12/03/22.
//

import Foundation

protocol ForecastDetailPresenterOutput {
    func showDayForecast(viewModel: ForecastDetailViewModel)

}
final class ForecastDetailPresenter {
    let output: ForecastDetailPresenterOutput
    init(output: ForecastDetailPresenterOutput) {
        self.output = output
    }
    
    func showForecastFor(_ day: Forecastday, _ headerVM: ForecastHeaderViewModel) {
        output.showDayForecast(viewModel: ForecastDetailViewModel(day: day, headerVM))
    }
}
