//
//  SettingView.swift
//  CleanWeather
//
//  Created by Nikhil Nangia on 13/03/22.
//

import UIKit

class SettingView: BaseView {
    lazy var tempunitLabel: UILabel = UILabel.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 1
        $0.text = "Show Temp In Celsuis"
    }
    lazy var unitSwitch: UISwitch = UISwitch.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setOn(NSConstantMethods.instance.currentTempUnitIsCelsuis, animated: true)
    }
    override func setupViews() {
        addsub(views: tempunitLabel, unitSwitch)
        tempunitLabel.anchor(top: topAnchor, left: leftAnchor, paddingTop: 20, paddingLeft: 20, height: 30)
        unitSwitch.anchor(top: topAnchor, right: rightAnchor, paddingTop: 20, paddingRight: 20, width: 50, height: 30)
    }

}
