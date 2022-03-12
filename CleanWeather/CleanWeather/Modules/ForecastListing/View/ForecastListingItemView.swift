//
//  ForecastListingItemView.swift
//  CleanWeather
//
//  Created by Nikhil Nangia on 12/03/22.
//

import UIKit

class ForecastListingItemView: BaseView {
    let styler = ForecastListingStyler.myModule
    lazy var titleLabel: UILabel = UILabel.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 1
    }
    lazy var subTitleLabel: UILabel = UILabel.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 2
    }
    lazy var tempRange: UILabel = UILabel.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 1
    }
    
    override func setupViews() {
        addsub(views: titleLabel, subTitleLabel, tempRange)
        titleLabel.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 4, paddingLeft: 4, paddingRight: 4)
        subTitleLabel.anchor(top: titleLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 2, paddingLeft: 4, paddingRight: 4)
        tempRange.anchor(top: subTitleLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 8, paddingLeft: 4, paddingRight: 4)
    }
    func setupInfo(viewModel: ForecastItemListingViewModel) {
        styler.apply(textStyle: .listingCellTitle(viewModel.title), to: titleLabel)
        styler.apply(textStyle: .listingCellSubTitle(viewModel.subtitle), to: subTitleLabel)
        styler.apply(textStyle: .listingCellSubTitle(viewModel.tempRange), to: tempRange)
    }
}
