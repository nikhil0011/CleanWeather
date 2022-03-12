//
//  ForecastDetailView.swift
//  CleanWeather
//
//  Created by Nikhil Nangia on 12/03/22.
//

import UIKit

class ForecastDetailView: BaseView {
    lazy var regionName: UILabel = UILabel.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 1
    }
    lazy var currentTemp: UILabel = UILabel.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 1
    }
    lazy var weatherSentiment: UILabel = UILabel.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 1
    }
    let styler: ForecastDetailStyler = ForecastDetailStyler.myModule
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = LColor.surface
        view.contentInset = .init(top: 20, left: 0, bottom: 0, right: 20)
        view.register(cell: ForecastHourCollectionViewCell.self)
        return view
    }()
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
        mainView.addArrangedSubview(regionName)
        mainView.addArrangedSubview(currentTemp)
        mainView.addArrangedSubview(weatherSentiment)
        addsub(views: mainView, collectionView)
        mainView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 20, paddingRight: 20)
        collectionView.anchor(top: mainView.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 8, height: 140)
    }
    func setup(viewModel: ForecastHeaderViewModel) {
        styler.apply(textStyle: .regionLabel(viewModel.regionLabel), to: regionName)
        styler.apply(textStyle: .currentTempLabel(viewModel.tempLabel), to: currentTemp)
        styler.apply(textStyle: .weatherSentimentLabel(viewModel.isDayValue), to: weatherSentiment)
    }
}
