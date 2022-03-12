//
//  ForecastListingViewController.swift
//  CleanWeather
//
//  Created by Nikhil Nangia on 12/03/22.
//

import UIKit

class ForecastListingViewController: UIViewController {
    weak var coordinator: MainCoordinator?

    lazy var listView: ForecastListingView = ForecastListingView.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.stack(listView)
        ActivityIndicator.shared.showProgressView(self.view)
    }
    

  
}
extension ForecastListingViewController: ForecastListingPresenterOutput {
    func showForecast(viewModel: ForecastListingViewModel) {
        ActivityIndicator.shared.hideProgressView()
//        setupDataSource(viewModel: viewModel)
//        self.viewTitle = viewModel.data.title
    }
    
    func showError(error: GenericResponse) {
        ActivityIndicator.shared.hideProgressView()
        if let description = error.localizedDescription {
            SharedAlert.sharedInstance.alert(view: self, title: "Network Request Failed", message: description)
        }
    }
 
}
