//
//  ForecastListingHeaderView.swift
//  CleanWeather
//
//  Created by Nikhil Nangia on 12/03/22.
//

import UIKit
class ForecastHeader: UICollectionReusableView, ReusableCell {
    let styler: ForecastListingStyler = ForecastListingStyler.myModule
  
    lazy var regionLabel: UILabel = UILabel.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    lazy var latlongLabel: UILabel = UILabel.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy var lastUpdatedLabel: UILabel = UILabel.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    lazy var feelsLikeLabel: UILabel = UILabel.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    lazy var tempLabel: UILabel = UILabel.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
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
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    func setupViews() {
        mainView.addArrangedSubview(regionLabel)
        mainView.addArrangedSubview(feelsLikeLabel)
        mainView.addArrangedSubview(tempLabel)
        mainView.addArrangedSubview(latlongLabel)
        mainView.addArrangedSubview(lastUpdatedLabel)
        addsub(views: mainView)
        mainView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 12, paddingLeft: 20, paddingBottom: 8, paddingRight: 20)
    }
    func configure(_ viewModel: ForecastHeaderViewModel?) {
        if let model = viewModel {
            styler.apply(textStyle: .headerRegionLabel(model.regionLabel), to: regionLabel)
            styler.apply(textStyle: .headerTempLabel(model.tempLabel), to: tempLabel)
            styler.apply(textStyle: .headerLatlongLabel(model.latlongLabel), to: latlongLabel)
            styler.apply(textStyle: .headerUpdatedAtLabel(model.lastUpdatedLabel), to: lastUpdatedLabel)
            styler.apply(textStyle: .headerFeelsLikeLabel(model.feelsLikeLabel), to: feelsLikeLabel)
        }
    }
}
