//
//  SettingsViewController.swift
//  CleanWeather
//
//  Created by Nikhil Nangia on 13/03/22.
//

import UIKit

class SettingsViewController: UIViewController {
    weak var coordinator: MainCoordinator?

    lazy var settingView: SettingView = SettingView.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        $0.unitSwitch.addTarget(self, action: #selector(unitChanged), for: .valueChanged)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
        self.view.stack(settingView)
        customiseBackItem(image: UIImage.App.dismiss, action: #selector(navigateBack))
    }
    @objc func navigateBack(sender: UIButton) {
        coordinator?.dismiss()
    }
    @objc func unitChanged() {
        NSConstantMethods.instance.currentTempUnitIsCelsuis = settingView.unitSwitch.isOn
        Logger.log(type: .info, msg: "Current time in celsuis \(NSConstantMethods.instance.currentTempUnitIsCelsuis)")
    }
}
