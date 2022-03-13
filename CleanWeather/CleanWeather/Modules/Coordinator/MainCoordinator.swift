//
//  MainCoordinator.swift
//  CleanWeather
//
//  Created by Nikhil Nangia on 12/03/22.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
class MainCoordinator: Coordinator {
    // MARK: We are not using it here it is always Empty
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let vc = ViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    func navigateToForecase(location: String) {
        let vc = ForecastListingViewController()
        vc.coordinator = self
        let isConnected = Reachability.isConnectedToNetwork()
        let source: DataSource = isConnected ? .remote : .local
        let presenter = ForecastListingPresenter(output: WeakRef(vc))
        let usecase = ForecastListingUseCase(output: presenter, source: source)
        usecase.fetch(location: location)
        navigationController.pushViewController(vc, animated: true)
    }
    func showForecastDetailFor(day: Forecastday, _ headerViewModel: ForecastHeaderViewModel) {
        let vc = ForecastDetailViewController()
        vc.coordinator = self
        let presenter = ForecastDetailPresenter(output: WeakRef(vc))
        presenter.showForecastFor(day, headerViewModel)
        navigationController.pushViewController(vc, animated: true)
    }
    func showSettings() {
        let vc = SettingsViewController()
        let navigationVC = BaseNavigationViewController(rootViewController: vc)
        vc.coordinator = self
        navigationController.present(navigationVC, animated: true)
    }
}
