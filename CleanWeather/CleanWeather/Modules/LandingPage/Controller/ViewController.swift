//
//  ViewController.swift
//  CleanWeather
//
//  Created by Nikhil Nangia on 12/03/22.
//

import UIKit

class ViewController: UIViewController {
    weak var coordinator: MainCoordinator?
    
    lazy var pageview: LandingPageView = LandingPageView.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        $0.doneButton.addTarget(self, action: #selector(getForecast(sender:)), for: .touchUpInside)
        $0.inputField.delegate = self
    }
    @objc func getForecast(sender: UIButton) {
        if let location = pageview.inputField.text, location.count > 2 {
            let input = location.trimmingCharacters(in: .whitespacesAndNewlines)
            coordinator?.navigateToForecase(location: input)
        } else {
            SharedAlert.sharedInstance.alert(view: self, title: "Alert", message: "Please enter atleast 3 characters")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.stack(pageview)
        setupNavbar()
    }
    func setupNavbar() {
        addRightBarItem(image: UIImage.App.settings, action: #selector(navigateToSetting))
    }
    @objc func navigateToSetting() {
        coordinator?.showSettings()
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
