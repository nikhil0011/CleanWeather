//
//  ForecastHourCollectionViewCell.swift
//  CleanWeather
//
//  Created by Nikhil Nangia on 13/03/22.
//

import UIKit

class ForecastHourCollectionViewCell: BaseCollectionViewCell, ConfigurableCell {
    typealias T = ForecastDetailItemViewModel
    let styler: ForecastDetailStyler = ForecastDetailStyler.myModule
    lazy var tempLabel: UILabel = UILabel.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 1
    }
    lazy var dayHour: UILabel = UILabel.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 1
    }
    
    private var mainView: UIStackView = {
        let stackView = StackViewFactory.getStackView(
            axis: .vertical,
            alignment: .fill,
            distribution: .fill,
            spacing: 6
        )
        return stackView
    }()
    
    override func setupViews() {
        self.layer.borderColor = LColor.primary.alpha(with: .opacity12).cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 4
        mainView.addArrangedSubview(tempLabel)
        mainView.addArrangedSubview(dayHour)
        addsub(views: mainView)
        mainView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8)
    }
    func configure(_ item: T, at indexPath: IndexPath) {
        styler.apply(textStyle: .hourTempLabel(item.currentTemp), to: tempLabel)
        styler.apply(textStyle: .hourTimeLabel(item.time), to: dayHour)

    }
}
