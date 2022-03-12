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
//        let presenter = RecipeListingPresenter(output: WeakRef(vc))
//        let usecase = RecipeListingUseCase(output: presenter)
//        usecase.fetch()
        navigationController.pushViewController(vc, animated: true)
    }
    func navigateToForecase(location: String) {
        let vc = ForecastListingViewController()
        vc.coordinator = self
        let presenter = ForecastListingPresenter(output: WeakRef(vc))
        let usecase = ForecastListingUseCase(output: presenter)
        usecase.fetch(location: location)
        navigationController.pushViewController(vc, animated: true)
    }
}
