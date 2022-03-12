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
        stack(regionLabel, feelsLikeLabel, tempLabel, latlongLabel, lastUpdatedLabel, spacing: 6, alignment: .top, distribution: .fillEqually).withMargins(.init(top: 12, left: 20, bottom: 8, right: 20))
    }
    func configure(viewModel: ForecastHeaderViewModel?) {
        if let model = viewModel {
            styler.apply(textStyle: .headerRegionLabel(model.regionLabel), to: regionLabel)
            styler.apply(textStyle: .headerTempLabel(model.tempLabel), to: tempLabel)
            styler.apply(textStyle: .headerLatlongLabel(model.latlongLabel), to: latlongLabel)
            styler.apply(textStyle: .headerUpdatedAtLabel(model.lastUpdatedLabel), to: lastUpdatedLabel)
            styler.apply(textStyle: .headerFeelsLikeLabel(model.feelsLikeLabel), to: feelsLikeLabel)
        }
    }
}
