//
//  WeakRef.swift
//  CleanWeather
//
//  Created by Nikhil Nangia on 12/03/22.
//

import Foundation

public final class WeakRef<T: AnyObject> {
    public weak var object: T?
    
    public init(_ object: T) {
        self.object = object
    }
}
extension WeakRef: ForecastListingPresenterOutput where T: ForecastListingPresenterOutput {
    func showError(error: GenericResponse) {
        object?.showError(error: error)
    }
    
    func showForecast(viewModel: ForecastListingViewModel) {
        object?.showForecast(viewModel: viewModel)
    }
}
extension WeakRef: ForecastDetailPresenterOutput where T: ForecastDetailPresenterOutput {
    func showDayForecast(viewModel: ForecastDetailViewModel) {
        object?.showDayForecast(viewModel: viewModel)
    }
}

