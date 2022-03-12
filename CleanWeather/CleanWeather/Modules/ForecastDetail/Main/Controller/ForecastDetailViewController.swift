//
//  ForecastDetailViewController.swift
//  CleanWeather
//
//  Created by Nikhil Nangia on 12/03/22.
//

import UIKit

class ForecastDetailViewController: UIViewController {
    weak var coordinator: MainCoordinator?
    var dataSource: ForecastHourDetailDataSource?

    lazy var detailView: ForecastDetailView = ForecastDetailView.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.stack(detailView)
    }
    private func setupDataSource(_ viewModel: ForecastDetailViewModel) {
        dataSource = ForecastHourDetailDataSource(collectionView: detailView.collectionView, array: viewModel.listOfItemVM())
        self.detailView.collectionView.reloadData()
    }
}
extension ForecastDetailViewController: ForecastDetailPresenterOutput {
    func showDayForecast(viewModel: ForecastDetailViewModel) {
        self.title = viewModel.day.date
        detailView.setup(viewModel: viewModel.headerViewModel)
        setupDataSource(viewModel)
    }
}
